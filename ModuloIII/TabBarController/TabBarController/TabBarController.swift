//
//  TabBarController.swift
//  TabBarController
//
//  Created by Diplomado on 03/11/23.
//

import UIKit

class TabBarController: UITabBarController{
    
    let firstView = FirtsViewController()
    let secondView = SecondViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setViewControllers([firstView,secondView], animated: true)
        
        self.tabBar.backgroundColor = .white
        self.tabBar.backgroundColor = .black
    }
    

    

    

}
