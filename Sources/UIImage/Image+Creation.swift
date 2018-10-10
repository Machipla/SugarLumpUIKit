//
//  Image+Creation.swift
//  GoogleToolboxForMac
//
//  Created by Mario Chinchilla on 2/11/17.
//

import Foundation
import SugarLumpCoreGraphics

public extension UIImage{
    public enum JPEGCompression: RawRepresentable{
        case lowest
        case low
        case medium
        case high
        case highest
        case custom(value:Float)
        
        public var rawValue: Float{
            switch self {
            case .lowest:  return 1
            case .low:     return 0.75
            case .medium:  return 0.5
            case .high:    return 0.25
            case .highest: return 0
            case let .custom(value): return value
            }
        }
        
        public init?(rawValue: Float) {
            switch rawValue {
            case 1:     self = .lowest
            case 0.75:  self = .low
            case 0.5:   self = .medium
            case 0.25:  self = .high
            case 0:     self = .highest
            default:    self = .custom(value: rawValue)
            }
        }
    }
    
    convenience init?(named:String, inBundleOf classInstance:AnyObject){
        self.init(named: named, in: Bundle(for: type(of: classInstance)))
    }
    
    convenience init?(size:CGSize, color:UIColor){
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let createdImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let image = createdImage else { return nil }
        self.init(image: image)
    }
    
    convenience init?(grandient size:CGSize, colors:[UIColor]){
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x:0, y:0, width:size.width, height:size.height);
        gradientLayer.colors = colors

        UIGraphicsBeginImageContext(size);
        gradientLayer.render(in: currentContext)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        guard let image = gradientImage else { return nil }
        self.init(image: image)
    }
    
    convenience init?(image:UIImage){
        guard let cgImage = image.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    convenience init?(named:String, in bundle:Bundle?){
        self.init(named: named, in: bundle, compatibleWith: nil)
    }
    
    func performingGraphicOpeartions(_ operations:((CGContext) -> Void)) -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(self.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        operations(context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func resized(to size:CGSize) -> UIImage?{
        let resizingRect = CGRect(origin: .zero, size: size)
        return resized(on: resizingRect)
    }
    
    func resized(with insets:CGRect.Insets) -> UIImage?{
        let resizingRect = CGRect(origin: .zero, size: size).insetting(by: insets)
        return resized(on: resizingRect)
    }
    
    func resized(on rect:CGRect) -> UIImage?{
        return performingGraphicOpeartions{ context in
            draw(in: rect)
        }
    }
    
    func addBackgroundColor(_ color:UIColor, insets:CGRect.Insets = .zero, cornerRadius:Float = 0) -> UIImage? {
        return performingGraphicOpeartions{ context in
            let rect = CGRect(origin: .zero, size: size)
            let insetsRect = rect.insetting(by: insets)
            let clipPath = UIBezierPath(roundedRect: insetsRect, cornerRadius: CGFloat(cornerRadius))
            
            context.translateBy(x: 0, y: size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            
            context.setBlendMode(.normal)
            color.setFill()
            clipPath.addClip()
            
            context.fill(insetsRect)
            context.draw(self.cgImage!, in: rect)
        }
    }
    
    func colored(by color:UIColor) -> UIImage?{
        let templateImage = withRenderingMode(.alwaysTemplate)
        return templateImage.performingGraphicOpeartions{ context in
            color.set()
            templateImage.draw(in: CGRect(origin: .zero, size: templateImage.size))
        }
    }
    
    func asJPEGRepresentation(compression:JPEGCompression = .lowest) -> Data?{
        return UIImageJPEGRepresentation(self, CGFloat(compression.rawValue))
    }
}
