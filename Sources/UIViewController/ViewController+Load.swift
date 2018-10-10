//
//  ViewController+Load.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension UIViewController{
    /// Declares the nib name from where to load an instance of this kind of UIViewController
    class var loadNibName:String{ return String(describing: self) }
    class var loadBundle:Bundle{ return Bundle(for: self) }
}
