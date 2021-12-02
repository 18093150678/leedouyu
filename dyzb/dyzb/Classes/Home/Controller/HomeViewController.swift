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
      
        //按钮定义
        let btn = UIBarButtonItem.init(imageName: "icon_share_logo");
        //左边 按钮 logo
        navigationItem.leftBarButtonItem = btn;
        //uibarbuttonitem rightbutton size
        let size : CGSize = CGSize.init(width: 40, height: 30);
        //右边 按钮
        //历史
        let hosty = UIBarButtonItem.init(imageName: "icon_my_scan", size: size);
        //搜索
        let search = UIBarButtonItem.init(imageName: "icon_pathgift_history_disable", size: size);
        //扫描
        let qcode =  UIBarButtonItem.init(imageName: "subscribe_icon_search", size: size);

        navigationItem.rightBarButtonItems = [hosty, search ,qcode];
    }
}
