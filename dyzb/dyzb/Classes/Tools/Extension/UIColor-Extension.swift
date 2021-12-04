//
//  UIColor-Extension.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/5.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat){
        
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0);
    }
    
}
