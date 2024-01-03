//
//  ViewController.swift
//  nike-app
//
//  Created by Гость on 17.12.2023.
//

import UIKit

class ShopController: UIViewController {
    @IBOutlet weak var shop: UIButton!
    
    @IBOutlet weak var gendersView: UICollectionView!
    @IBOutlet weak var popular: UICollectionView!
    
    @IBOutlet weak var newsProductView: UICollectionView!
    var shopSource: ShopInit = ShopInit()
    var selectedGroupIndex = 0
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let layoutProducts: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let cellSpacing: CGFloat = 2
    let cellsPerRow: CGFloat = 6

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.popular.register(UINib(nibName: "PopularCell", bundle: nil), forCellWithReuseIdentifier:  "PopularCell")
        self.gendersView.register(UINib(nibName: "GroupCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
        self.newsProductView.register(UINib(nibName: "NewsProductViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsProductViewCell")
        self.newsProductView.contentMode = UIView.ContentMode.scaleAspectFit

        self.popular.dataSource = self
        self.popular.delegate = self
        
        self.gendersView.dataSource = self
        self.gendersView.delegate = self
        
        self.newsProductView.dataSource = self
        self.newsProductView.delegate = self
        // Do any additional setup after loading the view.

        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 150)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.newsProductView.collectionViewLayout = layout
        
        layoutProducts.itemSize = CGSize(width: UIScreen.main.bounds.width/3, height: 150)
        layoutProducts.minimumInteritemSpacing = 0
        layoutProducts.minimumLineSpacing = 0
        layoutProducts.scrollDirection = UICollectionView.ScrollDirection.horizontal
        self.popular.collectionViewLayout = layoutProducts
    }


}
extension ShopController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == gendersView{
            return shopSource.shopGroupds.count
        } else if collectionView == popular {
            let group = shopSource.shopGroupds[selectedGroupIndex]
            return group.topipcs.count
        } else {
            let group = shopSource.shopGroupds[selectedGroupIndex]
            return group.newsProduct.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == gendersView{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
                let group = shopSource.shopGroupds[indexPath.item]
                let isSelected = group.gender == shopSource.shopGroupds[selectedGroupIndex].gender
                cell.setupCell(group: group.gender, isSelected: isSelected)
                return cell
            }else if collectionView == popular{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
                let group = shopSource.shopGroupds[selectedGroupIndex]
                let product = group.topipcs[indexPath.item]
                cell.setupCell(popularTopic: product)
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsProductViewCell", for: indexPath) as! NewsProductViewCell
                let group = shopSource.shopGroupds[selectedGroupIndex]
                let product = group.newsProduct[indexPath.item]
                cell.setupCell(image: product.image, label: product.label)
                return cell
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == gendersView{
        
                self.selectedGroupIndex = indexPath.item
                self.popular.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
//                }
                self.gendersView.reloadData()
                self.newsProductView.reloadData()
                self.popular.reloadData()
            }
            else if collectionView == popular {
                var topic = self.shopSource.shopGroupds[selectedGroupIndex].topipcs[indexPath.item]
                let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "GoodsViewController") as! GoodsViewController
                nextViewController.modalPresentationStyle = .fullScreen
                nextViewController.setTopicName(topic: topic.label)
                nextViewController.setTagId(tagId: topic.tag)
                self.navigationController!.pushViewController(nextViewController, animated: true)
            }
        }
}

