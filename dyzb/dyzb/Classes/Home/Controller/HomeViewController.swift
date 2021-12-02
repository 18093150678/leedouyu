//
//  HomeViewController.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/2.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置ui界面
        setupUI();
    }

}

extension HomeViewController {
    private func setupUI(){
        setNavigationBar();
    }
    private func setNavigationBar(){
      
        let btn : UIButton = UIButton.init();
        btn.setImage(UIImage.init(named: "icon_share_logo"), for: UIControl.State.normal);
        btn.sizeToFit();
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn);
        
        
        let size : CGSize = CGSize.init(width: 40, height: 30);
        
        let hosty : UIButton = UIButton.init();
        hosty.setImage(UIImage.init(named: "icon_my_scan"), for: UIControl.State.normal);
        hosty.frame = CGRect.init(origin: CGPoint.zero, size: size);
        
        let search : UIButton = UIButton.init();
        search.setImage(UIImage.init(named: "icon_pathgift_history_disable"), for: UIControl.State.normal);
        search.frame = CGRect.init(origin: CGPoint.zero, size: size);
   
        
        let qcode : UIButton = UIButton.init();
        qcode.setImage(UIImage.init(named: "subscribe_icon_search"), for: UIControl.State.normal);
        qcode.frame = CGRect.init(origin: CGPoint.zero, size: size);

        
        navigationItem.rightBarButtonItems = [ UIBarButtonItem.init(customView: hosty), UIBarButtonItem.init(customView: search) ,UIBarButtonItem.init(customView: qcode)];
    }
}
