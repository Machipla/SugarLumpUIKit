//
//  UIEdgeInsets+Creation.swift
//  Pods
//
//  Created by Mario Chinchilla on 23/6/17.
//
//

import Foundation

public extension UIEdgeInsets{
    public mutating func join(_ inset:UIEdgeInsets,performing operation:((Float,Float) -> Float)){
        self = joining(inset, performing: operation)
    }
    
    public func joining(_ inset:UIEdgeInsets,performing operation:((Float,Float) -> Float)) -> UIEdgeInsets {
        let joinedTop     = CGFloat(operation(Float(top),Float(inset.top)))
        let joinedBottom  = CGFloat(operation(Float(bottom),Float(inset.bottom)))
        let joinedLeft    = CGFloat(operation(Float(left),Float(inset.left)))
        let joinedRight   = CGFloat(operation(Float(right),Float(inset.right)))
        return UIEdgeInsets(top: joinedTop, left: joinedLeft, bottom: joinedBottom, right: joinedRight)
    }
    
    @available(*,deprecated,message:"Use instance method joining(_:performing:) instead")
    public static func joining(inset1:UIEdgeInsets,inset2:UIEdgeInsets,by:((Float,Float) -> Float)) -> UIEdgeInsets {
        return inset1.joining(inset2, performing: by)
    }
    
    public static func +(left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return left.joining(right, performing: +)
    }
    
    public static func -(left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return left.joining(right, performing: -)
    }
    
    public static func *(left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return left.joining(right, performing: *)
    }
    
    public static func /(left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return left.joining(right, performing: /)
    }
}
