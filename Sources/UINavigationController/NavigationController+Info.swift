//
//  NavigationController+Info.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension UINavigationController{
    var rootViewController:UIViewController?{ return viewControllers.first }
    var onTransitionFromController:UIViewController?{ return transitionCoordinator?.viewController(forKey: .from) }
    var isOnPopTransition:Bool{
        guard let fromController = onTransitionFromController else { return false }
        guard !viewControllers.contains(fromController) else { return false }
        
        return true
    }
}
