//
//  UIFont+Register.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//

import Foundation

public extension UIFont {
    
    public enum RegisterError: Error{
        case resourceNotFound, dataCouldntBeLoaded, dataProviderCouldntBeLoaded, fontCouldntBeLoaded, fontRegisterFailed
    }
    
    public static func registerFontWithFilenameString(_ filenameString: String, on bundle: Bundle) throws{
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else { throw RegisterError.resourceNotFound }
        guard let fontData = NSData(contentsOfFile: pathForResourceString) else { throw RegisterError.dataCouldntBeLoaded }
        guard let dataProvider = CGDataProvider(data: fontData) else { throw RegisterError.dataProviderCouldntBeLoaded }
        guard let fontRef = CGFont(dataProvider) else { throw RegisterError.fontCouldntBeLoaded }
        
        if (CTFontManagerRegisterGraphicsFont(fontRef, nil) == false) {
            throw RegisterError.fontRegisterFailed
        }
    }
}
