//
//  TabController.swift
//  nike-app
//
//  Created by Гость on 23.12.2023.
//

import Foundation
import UIKit

class TabController: UITabBarController{
    
    @IBOutlet weak var tabView: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setupTabs()
    }
    
    private func setupTabs(){
        let home = self.createNav(with: "Hone", and: UIImage(systemName: "house"), vc: HomeController())
        let shop = self.createNav(with: "Shop", and: UIImage(systemName: "clock"), vc: ShopController())
        self.tabView.setItems([home, shop], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UITabBarItem{
        let nav = UITabBarItem(title: title, image: image, tag: 1)
        
        return nav
    }
}
