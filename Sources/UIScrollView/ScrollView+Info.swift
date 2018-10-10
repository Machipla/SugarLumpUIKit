//
//  ScrollView+Info.swift
//  Pods
//
//  Created by Mario Chinchilla on 31/5/17.
//
//

import Foundation


public struct ScrollDirection: OptionSet{
    public let rawValue: Int
    public init(rawValue: Int){ self.rawValue = rawValue }
    public init(number: Int){ self.init(rawValue: 1 << number) }
    
    public static let none       = ScrollDirection(number: 0)
    public static let horizontal = ScrollDirection(number: 1)
    public static let vertical   = ScrollDirection(number: 2)
}

public extension UIScrollView{
    
    var possibleScrollDirections:ScrollDirection{
        var possibleDirections:ScrollDirection = .none
        if self.bounds.size.width < self.contentSize.width{
            possibleDirections.remove(.none)
            possibleDirections.update(with: .horizontal)
        }
        if self.bounds.size.height < self.contentSize.height{
            possibleDirections.remove(.none)
            possibleDirections.update(with: .vertical)
        }
        
        return possibleDirections
    }
}
