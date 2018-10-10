//
//  UIAlertController.swift
//  Pods
//
//  Created by Mario Chinchilla on 12/6/17.
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
