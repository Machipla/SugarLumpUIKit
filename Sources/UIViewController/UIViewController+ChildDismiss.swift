//
//  UIViewController+ChildDismiss.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public extension UIViewController{
    func dismissing(_ childController:UIViewController) throws -> ChildControllerDismission{
        return try ChildControllerDismission(parentController: self, childController: childController)
    }
}

public extension UIViewController{
    enum ChildControllerDismissionError: Error{
        case childControllerParentMismatch
    }
}

public extension UIViewController{
    public final class ChildControllerDismission{
        public typealias AnimationsClosure = ((_ childView:UIView, _ containerView:UIView, _ completion:@escaping () -> Void) -> Void)
        
        public private(set) weak var parentController:UIViewController!
        public private(set) var childController:UIViewController
        public var containerView:UIView{ return childController.view.superview! }
        
        public private(set) var hasStarted:Bool = false
        private var animations:AnimationsClosure?
        
        public var isAnimated:Bool{ return animations != nil }
        
        fileprivate init(parentController:UIViewController,
                         childController:UIViewController,
                         animations:((UIView,UIView, () -> Void) -> Void)? = nil) throws {
            guard parentController.childViewControllers.contains(childController) else { throw ChildControllerDismissionError.childControllerParentMismatch }
            
            self.parentController = parentController
            self.childController = childController
            
            self.animations = animations
        }
        
        @discardableResult
        public func animating(by animations:@escaping AnimationsClosure) -> Self{
            self.animations = animations
            return self
        }

        @discardableResult
        public func dismiss(completion: (() -> Void)? = nil) -> Self{
            hasStarted = true

            childController.willMove(toParentViewController: nil)
            childController.beginAppearanceTransition(false, animated: isAnimated)
            childController.removeFromParentViewController()
            
            let finishHandler = {
                self.childController.view.removeFromSuperview()
                self.childController.didMove(toParentViewController: nil)
                self.hasStarted = false
                completion?()
            }
            
            if let animations = animations{
                animations(self.childController.view,self.containerView,finishHandler)
            }else{
                finishHandler()
            }
            
            return self
        }
    }
}
