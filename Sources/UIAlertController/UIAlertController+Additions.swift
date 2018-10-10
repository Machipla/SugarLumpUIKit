//
//  UIAlertController+Additions.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation
import UIKit

public extension UIAlertController{
    func addActions(_ actions:[UIAlertAction]){
        actions.forEach{ addAction($0) }
    }
}
