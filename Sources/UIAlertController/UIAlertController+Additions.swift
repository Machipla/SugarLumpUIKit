//
//  UIAlertController+Additions.swift
//  SwiftUtilsKit
//
//  Created by Mario Chinchilla on 30/5/18.
//

import Foundation
import UIKit

public extension UIAlertController{
    func addActions(_ actions:[UIAlertAction]){
        actions.forEach{ addAction($0) }
    }
}
