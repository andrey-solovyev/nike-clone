//
//  File.swift
//  nike-app
//
//  Created by Гость on 17.12.2023.
//

import Foundation
import UIKit
struct Group : Decodable {
    var name: String
    var products: [ExternalProduct]
}

struct Product : Decodable {
    var id: Int
    var name: String
    var description: String
    var image: String
    var productInfos: [ProductInfo]
    var amountColours: Int
    var price: Float
}

struct ProductInfo : Decodable {
    let mainImageName: String
    let nestedImagesNames: [String]
}

struct PopularTopic {
    var label: String
    var image: UIImage
    var tag: Int
}

struct NewsProduct {
    var label: String
    var image: UIImage
}

struct ShopGroup {
    var gender: String
    var topipcs: [PopularTopic]
    var newsProduct: [NewsProduct]
}

class ShopInit{
    var shopGroupds = [ShopGroup]()
    var popularTopics = [PopularTopic] ()
    var genders = [String]()

    init() {
        setup()
    }

    func setup(){
        let p1 = PopularTopic(label:"Best sellers", image: UIImage(named: "elite pro")!, tag:1)
        let p2 = PopularTopic(label:"Hikes", image: UIImage(named: "elite pro")!, tag:2)
        let p3 = PopularTopic(label:"All", image: UIImage(named: "elite pro")!, tag:3)
        let p4 = PopularTopic(label:"Bags", image: UIImage(named: "elite pro")!, tag:4)
        self.popularTopics = [p1, p2, p3, p4]
        self.genders = ["Men", "Women", "Kids"]
        let n1 = NewsProduct(label: "New&Feature", image: UIImage(named: "nike_boot")!)
        let n2 = NewsProduct(label: "Social", image: UIImage(named: "nike_boot")!)
        let n3 = NewsProduct(label: "Premium", image: UIImage(named: "nike_boot")!)
        let s1 = ShopGroup(gender: "Men", topipcs: popularTopics, newsProduct: [n1, n2, n3])
        let s2 = ShopGroup(gender: "Women", topipcs: [p3], newsProduct: [n1, n2, n3])
        let s3 = ShopGroup(gender: "Kids", topipcs: [p1], newsProduct: [n1, n2, n3])
        self.shopGroupds = [s1, s2, s3]
    }
}



class StartSource {
    var images = [UIImage]()
    
    init() {
        setup()
    }
    func setup(){
        let i1 = UIImage(named: "image 3")!
        let i2 = UIImage(named: "image 3")!
        let i3 = UIImage(named: "pngegg-2")!
        self.images = [i1, i2, i3]
        
    }
}
