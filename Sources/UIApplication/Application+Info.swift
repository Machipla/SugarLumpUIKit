//
//  Application+Info.swift
//  Pods
//
//  Created by Mario Chinchilla on 2/6/17.
//
//

import Foundation

public extension UIApplication{
    public var topMostViewController:UIViewController?{
        guard let rootController:UIViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        return self.topMostViewController(fromController: rootController);
    }
    
    private func topMostViewController(fromController:UIViewController) -> UIViewController? {
        if let presentedController = fromController.presentedViewController{
            return self.topMostViewController(fromController: presentedController)
        }else if let tabBarSelectedController = (fromController as? UITabBarController)?.selectedViewController{
            return self.topMostViewController(fromController: tabBarSelectedController)
        }else if let navigationTopController = (fromController as? UINavigationController)?.topViewController{
            return self.topMostViewController(fromController: navigationTopController)
        }else{
            return fromController
        }
    }
}
