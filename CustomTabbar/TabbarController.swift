//
//  TabbarController.swift
//  CustomTabbar
//
//  Created by Chittapon Thongchim on 26/11/2560 BE.
//  Copyright © 2560 Chittapon Thongchim. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    @IBOutlet weak var tabbarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isHidden = true
        self.moreNavigationController.navigationBar.isHidden = true
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = tabbarView.backgroundColor
        
        view.addSubview(backgroundView)
        view.addSubview(tabbarView)
   
        var leftAnchor: NSLayoutXAxisAnchor {
            if #available(iOS 11.0, *) {
                return self.view.safeAreaLayoutGuide.leftAnchor
            }
            return self.view.leftAnchor
        }
        
        var rightAnchor: NSLayoutXAxisAnchor {
            if #available(iOS 11.0, *) {
                return self.view.safeAreaLayoutGuide.rightAnchor
            }
            return self.view.rightAnchor
        }
        
        var bottomAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return self.view.safeAreaLayoutGuide.bottomAnchor
            }
            return self.view.bottomAnchor
        }
        
        //Set Contraint Tabbar View
        
        tabbarView.translatesAutoresizingMaskIntoConstraints = false
        tabbarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        tabbarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        tabbarView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        let tabbarHeight: CGFloat = 49.0
        let height = NSLayoutConstraint(item: tabbarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: tabbarHeight)
        tabbarView.addConstraint(height)
        
        //Set Contraint background View
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leftAnchor.constraint(equalTo: tabbarView.leftAnchor, constant: 0).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: tabbarView.rightAnchor, constant: 0).isActive = true
        backgroundView.topAnchor.constraint(equalTo: tabbarView.topAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectItem(_ sender: UIButton) {
        
        selectedIndex = sender.tag
    }

}
