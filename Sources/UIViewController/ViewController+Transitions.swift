//
//  ViewController+Transitions.swift
//  ADAppRater
//
//  Created by Mario Chinchilla on 31/10/17.
//

import Foundation

public extension UIViewController{
    func performOnCurrentTransitionCompletion(_ completion:@escaping (() -> Void)){
        guard isOnTransition else { return }
        transitionCoordinator?.animate(alongsideTransition: nil){ _ in completion() }
    }
}
