//
//  PageContentView.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/5.
//

import UIKit

private let cellName : String = "cellid";

class PageContentView: UIView {
    
    private var chidVcs : [UIViewController] ;
    private var parentViewController : UIViewController
    
    private lazy var collectionView : UICollectionView = {
        
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init();
        layout.itemSize =  self.bounds.size;
        //设置行间距
        layout.minimumLineSpacing = 0 ;
        //设置item边间距
        layout.minimumInteritemSpacing = 0;
        //设置滚动方向
        layout.scrollDirection = .horizontal;
        
        let collectionView : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout);
        collectionView.isPagingEnabled = true;
        collectionView.showsHorizontalScrollIndicator = false;
        collectionView.bounces = false;
        collectionView.frame = bounds;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        //注册cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellName);
        
        return collectionView;
        
    }()
    

    init(frame : CGRect,chidVcs : [UIViewController], parentViewController : UIViewController){
        self.chidVcs = chidVcs;
        self.parentViewController = parentViewController;
        super.init(frame: frame);
        setupUI();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageContentView {
    private func setupUI(){
        //把所有的chidVcs添加到父类控制器
        for chidVc in chidVcs {
            parentViewController.addChild(chidVc);
        }
        
        //添加一个collectionView
        self.addSubview(collectionView);
    }
}

extension PageContentView : UICollectionViewDelegate , UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return chidVcs.count;
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath);
        
         for view in cell.contentView.subviews {
             view.removeFromSuperview();
         }
         
        let chidVc = self.chidVcs[indexPath.item];
        chidVc.view.frame = cell.contentView.bounds;
        cell.contentView.addSubview(chidVc.view);
                  
        return cell;
    }
    
}
