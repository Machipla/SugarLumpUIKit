//
//  UIFont+Creation.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation

public extension UIFont{

    class func systemFontToFitSize(_ size:CGSize,forText text:String) -> UIFont{
        var currentFontSize:Float = max(Float(size.width),Float(size.height));
        
        var font:UIFont;
        var currentTextSize:CGSize;
        
        repeat{
            font = UIFont.systemFont(ofSize: CGFloat(currentFontSize) )
            currentTextSize = NSAttributedString(string: text, attributes: [NSAttributedStringKey.font:font]).boundingRect(with:size, options:.usesLineFragmentOrigin, context:nil).size;
            
            currentFontSize -= 1;
        }while(currentTextSize.height > size.height || currentTextSize.width > size.width)
        
        return font;
    }
    
    func copied(with trait:UIFontDescriptorSymbolicTraits) -> UIFont? {
        guard let fontTraitDescriptor = fontDescriptor.withSymbolicTraits(trait) else { return nil }
        
        let finalFont = UIFont(descriptor: fontTraitDescriptor, size: CGFloat(pointSize))
        return finalFont
    }

    @available(iOS 8.2, *)
    func copied(with fontWeight:UIFont.Weight) -> UIFont{
        let familyFontDescriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: familyName])
        let fontTraitDescriptor: UIFontDescriptor = familyFontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: [UIFontDescriptor.TraitKey.weight: (fontWeight.rawValue)]])
        return UIFont(descriptor: fontTraitDescriptor, size: CGFloat(pointSize))
    }
    
}

