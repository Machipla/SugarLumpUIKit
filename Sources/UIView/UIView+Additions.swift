//
//  UIView+Additions.swift
//  BoringSSL
//
//  Created by Mario Chinchilla on 12/6/18.
//

import Foundation
import UIKit

public extension UIView{
    public var isVisible:Bool   { return window != nil && !isHidden && isInstalled }
    public var isAnimating:Bool { return !(layer.animationKeys()?.isEmpty ?? true) }
    public var isInstalled:Bool { return superview != nil }
}
