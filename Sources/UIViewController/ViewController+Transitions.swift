//
//  ViewController+Transitions.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public extension UIViewController{
    func performOnCurrentTransitionCompletion(_ completion:@escaping (() -> Void)){
        guard isOnTransition else { return }
        transitionCoordinator?.animate(alongsideTransition: nil){ _ in completion() }
    }
}
