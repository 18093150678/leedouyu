//
//  PageTitleView.swift
//  dyzb
//
//  Created by 雷俊 on 2021/12/4.
//

import UIKit

class PageTitleView: UIView {

    private var titles : [String] ;
    private let kScrollerH : CGFloat  = 2;
    private var titleLabels : [UILabel] = [UILabel]();
    
    //懒加载scrollerView
    private lazy var scrollview : UIScrollView = {
        
        let scrollview : UIScrollView = UIScrollView.init();
        scrollview.frame = bounds;
        scrollview.bounces = false;
        scrollview.scrollsToTop = false;
        scrollview.showsHorizontalScrollIndicator = false;
        return scrollview;
        
    }()

    //懒加载 scrollerline
    private lazy var scrollerline : UIView = {
        let scrollerline : UIView = UIView.init();
        scrollerline.backgroundColor = UIColor.orange;
        return  scrollerline;
    }()
    
    
    init(frame : CGRect , titles :  [String]){
        self.titles = titles;
        super.init(frame: frame);
        setupUI();
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageTitleView {
    //界面
    private func setupUI(){
        //添加scrollerview
        addSubview(scrollview);
        //设置label
        setupTitleLabels();
        //设置底部line and scrollerline
        setupBottomLineAndScrollLine();
    }
    
    /***
     scrollerView add label
     */
    private func setupTitleLabels(){
        
        let labelW : CGFloat = frame.width / CGFloat(titles.count) ;
        let labelH : CGFloat = frame.height;
        let labelY : CGFloat = 0;
        
        for (index , title) in self.titles.enumerated() {
            let titleLabel : UILabel = UILabel.init();
            titleLabel.text = title;
            titleLabel.font = UIFont.systemFont(ofSize: 16.0)
            titleLabel.textAlignment = .center;
            
            //设置frame
            let labelX : CGFloat = labelW * CGFloat(index);
            titleLabel.frame = CGRect.init(x: labelX, y: labelY, width: labelW, height: labelH);
            scrollview.addSubview(titleLabel);
            titleLabels.append(titleLabel);
        }
        
    }
    /**
     设置里呢scrollline
     */
    private func setupBottomLineAndScrollLine(){
        //设置bottom line
        let lineH :  CGFloat = 0.5
        let bottomLine : UIView = UIView.init();
        bottomLine.frame = CGRect.init(x: 0, y: frame.height - lineH, width: frame.width, height: lineH);
        bottomLine.backgroundColor = UIColor.lightGray;
        addSubview(bottomLine);
        
        //设置scroll line
        guard let label : UILabel = titleLabels.first else { return };
        label.textColor = UIColor.orange;
        scrollerline.frame = CGRect.init(x: label.frame.origin.x, y: frame.height - kScrollerH, width: label.frame.width, height: kScrollerH);
        scrollview.addSubview(scrollerline);
    }
}
