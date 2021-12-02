//
//  UIBarButtonItem-Extension.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/2.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
   convenience  init(imageName : String,size :CGSize){
    
       let btn : UIButton = UIButton.init();
       
       
       
       
       
       self.init(customView: btn)
    }
    
    
}

