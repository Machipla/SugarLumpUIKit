//
//  UIImageView+Additions.swift
//  Alamofire
//
//  Created by Mario Plaza on 26/9/18.
//

import Foundation

public extension UIImageView{
    var imageInset:UIEdgeInsets?{
        get{ return image?.alignmentRectInsets }
        set{ image = image?.withAlignmentRectInsets(newValue ?? .zero) }
    }
}
