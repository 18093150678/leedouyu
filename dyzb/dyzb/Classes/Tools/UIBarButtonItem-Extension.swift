//
//  UIBarButtonItem-Extension.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/2.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    convenience  init(imageName : String, size :CGSize = CGSize.zero){
    
       let btn : UIButton = UIButton.init();
       btn.setImage(UIImage.init(named: imageName), for: UIControl.State.normal);
       btn.setImage(UIImage.init(named: imageName), for: UIControl.State.highlighted);
        if size == CGSize.zero {
            btn.sizeToFit();
        }else {
            btn.frame = CGRect.init(origin: CGPoint.zero, size: size);

        }
       
       self.init(customView: btn)
    }
    
    
}

