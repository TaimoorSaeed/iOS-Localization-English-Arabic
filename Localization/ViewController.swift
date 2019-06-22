//
//  ViewController.swift
//  Localization
//
//  Created by Taimoor Saeed on 20/06/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeLbl.text = RKLocalizedString(key: "header_text", comment: "")
        
        print("Language : \(LocalizationSystem.sharedInstance.getLanguage())")
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        
        if RKLocalization.sharedInstance.getLanguage() == "en" {
            RKLocalization.sharedInstance.setLanguage(language: "ar")
        } else {
            RKLocalization.sharedInstance.setLanguage(language: "en")
        }
        
        DispatchQueue.main.async(execute: {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.initRootView()
        })
        
        
    }
    
    
}

