//
//  MainViewController.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/2.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVc(storyboardName: "Home");
        addChildVc(storyboardName: "Profile");
        addChildVc(storyboardName: "Live");
        addChildVc(storyboardName: "Follow");
    }
    
    private func addChildVc(storyboardName :  String){
        //获取home storyboard
        let childVc = UIStoryboard.init(name: storyboardName, bundle: nil).instantiateInitialViewController()!;
        //添加storyboard
        addChild(childVc);
    }


}
