//
//  NavigationItem+BarButtons.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation
import SugarLumpFoundation

public extension UINavigationItem{
    public enum BarButtonItemSide{
        case left, right
    }
    
    public func addButtonItem(_ item:UIBarButtonItem, on side:BarButtonItemSide, animated:Bool = true){
        let sideButtonItems = side == .left ? leftBarButtonItems : rightBarButtonItems
        var buttonItems = sideButtonItems ?? []
        buttonItems.append(item)
        
        side == .left ? setLeftBarButtonItems(buttonItems, animated: animated) : setRightBarButtonItems(buttonItems, animated: animated)
    }
    
    public func removeButtonItem(_ item:UIBarButtonItem, animated:Bool = true){
        if let leftButtonItems = leftBarButtonItems, leftButtonItems.contains(item){
            setLeftBarButtonItems(leftButtonItems.removing(element: item), animated: animated)
        }else if let rightButtonItems = rightBarButtonItems, rightButtonItems.contains(item){
            setRightBarButtonItems(rightButtonItems.removing(element: item), animated: animated)
        }
    }
}
