//
//  UIColor+Creation.swift
//  Pods
//
//  Created by Mario Chinchilla on 29/3/17.
//
//

import Foundation
import SugarLumpFoundation

public extension UIColor{
    class func randomColor() -> UIColor{
        return self.randomColor(whiteTolerance: 100)
    }
    
    class func randomColor(whiteTolerance tolerance:Float) -> UIColor{
        var clampedTolerancePercentage:Float = tolerance
        clampedTolerancePercentage.clamp(by: 0...100)
        let maxValueColor:Float = (clampedTolerancePercentage*255)/100
        let colorRange = 0...maxValueColor
        
        let randomRed     = Float.random(in: colorRange)
        let randomBlue    = Float.random(in: colorRange)
        let randomGreen   = Float.random(in: colorRange)
        
        return UIColor(red: CGFloat(randomRed/255), green: CGFloat(randomGreen/255), blue: CGFloat(randomBlue/255), alpha: 1)
    }
    
    convenience init(hex hexValue:Int){
        self.init(hex: hexValue, alpha: 1)
    }
    
    convenience init(hex hexValue:Int,alpha alphaValue:Float) {
        self.init(red: CGFloat((hexValue >> 16) & 0xFF)/255, green: CGFloat((hexValue >> 8) & 0xFF)/255, blue: CGFloat(hexValue & 0xFF)/255, alpha: CGFloat(alphaValue))
    }
}
