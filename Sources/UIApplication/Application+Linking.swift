//
//  Application+Linking.swift
//  SugarLumpUIKit
//
//  Created by Mario Chinchilla on 10/10/18.
//
//

import Foundation
import SugarLumpFoundation

public enum ApplicationLinkScheme:String{
    case mailApp = "message://"
    case mailAppSendEmail = "mailto://"
    case phone = "tel://"
}

public extension UIApplication{
    
    func linkTo(scheme:ApplicationLinkScheme){
        linkToRawURLIfPossible(scheme.rawValue)
    }
    
    func phoneCallTo(_ phoneNumber:String){
        guard phoneNumber.isPhoneNumber else { return }
        linkToRawURLIfPossible("tel://"+phoneNumber)
    }
    
    @available(iOS 8.0, *)
    func openSettings(){
        linkToRawURLIfPossible(UIApplicationOpenSettingsURLString)
    }
    
    func linkToRawURLIfPossible(_ rawURL:String){
        guard let url:URL = URL(string: rawURL) else { return }
        linkToURLIfPossible(url)
    }
    
    @discardableResult
    func linkToURLIfPossible(_ url:URL) -> Bool{
        guard canOpenURL(url) else { return false }
        
        openURL(url)
        return true
    }
}
