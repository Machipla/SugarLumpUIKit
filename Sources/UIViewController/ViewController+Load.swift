//
//  ViewController+Load.swift
//  Pods
//
//  Created by Mario Chinchilla on 25/7/17.
//
//

import Foundation

public extension UIViewController{
    /// Declares the nib name from where to load an instance of this kind of UIViewController
    class var loadNibName:String{ return String(describing: self) }
    class var loadBundle:Bundle{ return Bundle(for: self) }
}
