//
//  YLPopViewController.swift
//  放淘宝页面效果
//
//  Created by 余亮 on 16/6/14.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit

class YLPopViewController: UIViewController {
    var rootVC = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func show(){
        UIApplication.sharedApplication().windows[0].addSubview(popView)
        var rect  = popView.frame
        rect.origin.y = self.view.bounds.size.height - popView.frame.size.height
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { 
                self.rootView.layer.transform = self.firstTransform()
            }) { (finished) in
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { 
                        self.rootView.layer.transform = self.secondTransform()
                        self.maskView.alpha = 0.5
                        self.popView.frame = rect
                    }, completion: { (finished ) in
                        
                })
        }
    }

    /**
     *  初始化 rootVC:根VC， popView:弹出的view
     */
    func createPopVCWithRootVC(root : UIViewController , andPopView  popV : UIView) {
            rootVC = root
            popView = popV
            creteUI()
    }
    
    func creteUI(){
        self.view.backgroundColor = UIColor.blackColor()
        rootVC.view.frame = self.view.bounds
        rootVC.view.backgroundColor = UIColor.whiteColor()
        rootView = rootVC.view
        self.addChildViewController(rootVC)
        self.view.addSubview(rootView)
        rootView.addSubview(maskView)
    }
    
    func close (){
        var tempRect = popView.frame
        tempRect.origin.y += popView.frame.size.height
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
      
                //maskView 隐藏
                self.maskView.alpha = 0.0001
                //popView下降
                self.popView.frame = tempRect
            self.rootView.layer.transform = self.firstTransform()
            }) { (finished) in
                UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { 
//                        self.rootView.layer.transform = self.secondTransform()
                    self.rootVC.view.layer.transform = CATransform3DIdentity
                    }, completion: { (finished ) in
                        self.popView.removeFromSuperview()
                })
        }
    }
    
    func firstTransform() -> CATransform3D{
        var t1 = CATransform3DIdentity
        t1.m34 = 1.0 / -900
        //带点缩小的效果
        t1 = CATransform3DScale(t1, 0.95, 0.95, 1)
        //绕x轴旋转
        t1 = CATransform3DRotate(t1, 15.0 * (CGFloat)(M_PI / 180.0), 1, 0, 0)
        return t1
    }
    
    func secondTransform() -> CATransform3D{
        var  t2 = CATransform3DIdentity
        t2.m34 = self.firstTransform().m34
        //向上移
        t2 = CATransform3DTranslate(t2, 0 , self.view.frame.size.height*(-0.08), 0)
        //第二次缩小
        t2 = CATransform3DScale(t2, 0.8, 0.8, 1)
        return t2
    }
    
    //MARK:懒加载
    private lazy var popView : UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var rootView : UIView = {
        let view = UIView()
        return view
    }()
    
    
    private lazy var maskView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.0
        return view
    }()

}















































