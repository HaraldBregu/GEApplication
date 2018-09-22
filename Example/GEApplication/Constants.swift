//
//  Constants.swift
//  GAEventApplication
//
//  Created by harald bregu on 07/09/18.
//  Copyright © 2018 atom. All rights reserved.
//

import UIKit

//extension GAEvent {
//    enum Name {
//        static let Cat = "Cat"
//    }
//}


protocol AlertController {
    func presentAlert(title:String, message:String)
}

extension AlertController where Self:UIViewController {
    func presentAlert(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        self.present(alertController, animated: true, completion: nil)
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
