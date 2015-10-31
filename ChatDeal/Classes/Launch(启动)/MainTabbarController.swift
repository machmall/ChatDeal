//
//  ViewController.swift
//  拨易通
//
//  Created by dongjun on 15/10/31.
//  Copyright © 2015年 dongjun. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initChild("消息", image1:"message", image2: "message", childController: MessageViewController(), tab: self)
        self.initChild("分组", image1: "grouops", image2: "grouops", childController: GroupsViewController(), tab: self)
        self.initChild("动态", image1: "dynamic", image2: "dynamic", childController: DynamicViewController(), tab: self)
        
    }
    
    
    func initChild(title:String,image1:String,image2:String,childController:UIViewController,tab:UITabBarController){
        let nav:UINavigationController = UINavigationController(rootViewController: childController)
        
        nav.navigationBar.setBackgroundImage(UIImage(named: "navgation_top"), forBarMetrics:UIBarMetrics.Default)
        
        let la = UILabel(frame:CGRectMake(0, 0, 150, 50))
        la.text = title
        la.textColor = UIColor.whiteColor()
        la.textAlignment = NSTextAlignment.Center
        childController.navigationItem.titleView = la
        
        childController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: image1)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: image2)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal))
        
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orangeColor(),NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!], forState: UIControlState.Selected)
        
        tab.addChildViewController(nav)
        
    }

}

