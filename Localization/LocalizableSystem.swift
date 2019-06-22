//
//  LocalizableSystem.swift
//  Mama
//
//  Created by Taimoor Saeed on 22/06/2019.
//  Copyright © 2019 mama. All rights reserved.
//

import Foundation
import UIKit

class LocalizationSystem : NSObject {
    
    var bundle : Bundle!
    
    class var sharedInstance : LocalizationSystem {
        struct  Singleton {
            static let instance : LocalizationSystem = LocalizationSystem()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedStringForKey(key: String, comment: String) -> String {
//        return bundle.localizedString(forKey: key, value: comment, table: nil)
        
        print(bundle.localizedString(forKey: key, value: comment, table: nil))
        
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func localizedImagePathForImg(imagename :String, type : String) -> String{
        guard let imagePath = bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    
    func setLanguage(languageCode: String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        
        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "Iproj") {
            bundle = Bundle.init(path : languageDirectoryPath)
        }
        else {
            resetLocalization()
        }
    }
    
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    func getLanguage() -> String {
        let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        let prefferedLanguage = appleLanguages[0]
        return prefferedLanguage
        
    }
    
}

