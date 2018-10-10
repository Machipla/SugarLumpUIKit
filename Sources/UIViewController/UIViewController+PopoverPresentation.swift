//
//  UIAlertController.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension UIViewController{
    var popoverOriginView:UIView?{
        get{
            return popoverPresentationController?.sourceView
        }
        set{
            popoverPresentationController?.sourceView = newValue
            popoverPresentationController?.sourceRect = newValue?.bounds ?? CGRect.zero
        }
    }
    
    var popoverBarButtonItem:UIBarButtonItem?{
        get{ return popoverPresentationController?.barButtonItem }
        set{ popoverPresentationController?.barButtonItem = newValue }
    }
}
