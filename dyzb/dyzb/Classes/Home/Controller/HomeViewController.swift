//
//  HomeViewController.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/2.
//

import UIKit


private let kTitleViewH : CGFloat = 40;

class HomeViewController: UIViewController {
    
    //定义属性
    private lazy var pageTitleView  : PageTitleView = {
        let titeFrame =  CGRect.init(x: 0, y: kNavigationBarH + kStatusBarH, width: kScreenW, height: kTitleViewH);
        let titles : [String] = ["推荐","游戏","娱乐","趣玩"];
        let titleView : PageTitleView = PageTitleView.init(frame: titeFrame, titles: titles)
        return titleView;
    }()
    
    //懒加载 pagecontentview
    private lazy var pageContentView : PageContentView = {
        
        let pageViewY : CGFloat = kNavigationBarH + kStatusBarH + kTitleViewH;
        
        //这里确定添加的ViewController
        var chidVcs : [UIViewController] = [UIViewController]();
        for   index in 0 ..< 4 {
            let vc : UIViewController = UIViewController.init();
            vc.view.backgroundColor = UIColor.init(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)));
            chidVcs.append(vc);
        }
        let contentView : PageContentView = PageContentView.init(frame: CGRect.init(x: 0, y: pageViewY, width: kScreenW, height: kScreenH - pageViewY), chidVcs: chidVcs, parentViewController: self);
        
        return contentView;
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置ui界面
        setupUI();
    }
}

extension HomeViewController {
    private func setupUI(){
        //取消scroller自带向下偏移的属性
        automaticallyAdjustsScrollViewInsets = false;
        
        //设置导航栏
        setNavigationBar();
        
        //设置titleView
        view.addSubview(pageTitleView);
        
        //添加PageContentView
        self.view.addSubview(pageContentView);
        pageContentView.backgroundColor = UIColor.orange;
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

