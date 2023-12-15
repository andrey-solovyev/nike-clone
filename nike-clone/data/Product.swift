//
//  Product.swift
//  nike-clone
//
//  Created by andrey on 14.12.2023.
//

import Foundation
import UIKit
struct Group {
    var name: String
    var products: [Product]
}


struct Product {
    var image:UIImage
    var name: String
    var description: String
    var amountColours: Int
    var price: Float
}

class Menu {
    var groups = [Group]()
    init(){
        setup()
    }
    func setup(){
        let p1 = Product(image: UIImage(named: "elite pro")!, name: "Nike elite Pro", description: "Basketball Backpack (32L)", amountColours: 3, price: 85)
        let p2 = Product(image: UIImage(named: "elite 2")!, name: "Nike elite Pro", description: "Basketball Backpack (32L)", amountColours: 3, price: 85)
        let p3 = Product(image: UIImage(named: "bag 3")!, name: "Nike elite Pro", description: "Basketball Backpack (32L)", amountColours: 3, price: 85)
        
        let g1 = Group(name: "all", products: [p1, p2, p3])
        let g2 = Group(name: "bags", products: [p2])
        self.groups = [g1, g2]
    }
}
