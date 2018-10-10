//
//  UIFont+Creation.swift
//  Pods
//
//  Created by Mario Chinchilla on 3/4/17.
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
    
    func copy(trait: UIFontDescriptorSymbolicTraits) -> UIFont? {
        guard let fontTraitDescriptor = fontDescriptor.withSymbolicTraits(trait) else { return nil }
        
        let finalFont = UIFont(descriptor: fontTraitDescriptor, size: CGFloat(pointSize))
        return finalFont
    }
    
    
    /// Método que copia la fuente, pasando un peso por parámetro.
    ///
    /// - Parameter weight: Peso del cual obtener la copia de la fuente. Este comprende los valores que aceptaría la clave UIFontWeightTrait de UIFontDescriptor.
    /// I.e: UIFontWeightUltraLight, UIFontWeightThin, UIFontWeightMedium...
    /// Si una fuente no tiene el peso pasado por parámetro, se devolverá una fuente por defecto.
    /// - Returns: Copia de la fuente con el peso adecuado
    func copy(weight:CGFloat) -> UIFont {
        // Este descriptor hace falta dado que [self fontDescriptor] no parece reconocer el cambio de peso en la fuente...
        let familyFontDescriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: familyName])
        let fontTraitDescriptor: UIFontDescriptor = familyFontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: [UIFontDescriptor.TraitKey.weight: (weight)]])
        return UIFont(descriptor: fontTraitDescriptor, size: CGFloat(pointSize))
    }
    
    @available(iOS 8.2, *)
    func copy(fontWeight: UIFont.Weight) -> UIFont{
        return copy(weight: fontWeight.rawValue)
    }
    
}

