//
//  NavigationController+Info.swift
//  Pods
//
//  Created by Mario Chinchilla on 21/7/17.
//
//

import Foundation

public extension UINavigationController{
    /// RootController de este navigationController o nil si todavía no hay ninguno
    var rootViewController:UIViewController?{ return viewControllers.first }
    
    /// Devuelve el fromController cuando este navigationController está realizando una transición. Si no hay ninguna transicion o no se pudo localizar el fromController, esta variable es nil
    var onTransitionFromController:UIViewController?{ return transitionCoordinator?.viewController(forKey: .from) }
    
    /// True si este navigation Controller está en una transición en curso de pop
    var isOnPopTransition:Bool{
        guard let fromController = onTransitionFromController else { return false }
        guard !viewControllers.contains(fromController) else { return false }
        
        return true
    }
}
