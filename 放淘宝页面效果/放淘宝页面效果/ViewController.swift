//
//  ViewController.swift
//  放淘宝页面效果
//
//  Created by 余亮 on 16/6/14.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.mainScreen().bounds.size.width
let HEIGHT = UIScreen.mainScreen().bounds.size.height

class ViewController: YLPopViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubViews()
    }

    func setUpSubViews(){
        let root = RootViewController()
        root.title = "很爱很爱"
        let nav = UINavigationController.init(rootViewController: root)
        popView.addSubview(closeBtn)
        root.view.addSubview(openBtn)
        
        self.createPopVCWithRootVC(nav, andPopView: popView)
    }
    
    private lazy var popView : UIView = {
        let view = UIView(frame:CGRectMake(0,HEIGHT, WIDTH, HEIGHT / 2.0 ))
        view.backgroundColor = UIColor.grayColor()
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSizeMake(0.5, 0.5)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 5
        return view
    }()
    
    private lazy var closeBtn : UIButton = {
        let btn = UIButton(frame:CGRectMake(15,0 ,50,40))
        btn.setTitle("关闭", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btn.addTarget(self , action: #selector(close), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    private lazy var openBtn : UIButton = {
        let btn = UIButton(frame:CGRectMake((WIDTH - 100)*0.5, 300, 100, 40))
        btn.setTitle("开启", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn.addTarget(self , action: #selector(show), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
}





































