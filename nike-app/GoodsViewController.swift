//
//  GoodsViewController.swift
//  nike-app
//
//  Created by Гость on 17.12.2023.
//

import Foundation
import UIKit

class GoodsViewController : UIViewController {

    
    @IBOutlet weak var productsView: UICollectionView!
    @IBOutlet weak var groupdsCollectionView: UICollectionView!
    @IBOutlet weak var navigation: UINavigationItem!
    var menu: Menu = Menu()
    var selectedGroupIndex = 0
    var topicName = ""
    var tagId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.productsView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier:  "ProductCell")
        self.groupdsCollectionView.register(UINib(nibName: "GroupCell", bundle: nil), forCellWithReuseIdentifier: "GroupCell")
        self.productsView.dataSource = self
        self.productsView.delegate = self
        self.groupdsCollectionView.dataSource = self
        self.groupdsCollectionView.delegate = self
        self.navigation.title = topicName
        let newBackButton = UIBarButtonItem(title: "Back",
                                            style: UIBarButtonItem.Style.plain, target: self, action: Selector(("backAction")))
        navigationController?.navigationBar.topItem?.backBarButtonItem = newBackButton
        self.navigationItem.backBarButtonItem = newBackButton
    }
    
    func backAction() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTopicName(topic: String){
        self.topicName = topic
    }
    
    func setTagId(tagId: Int){
        self.tagId = tagId
    }

}
extension GoodsViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == groupdsCollectionView{
            return menu.groups.count
        } else {
            let group = menu.groups[selectedGroupIndex]
            return group.products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == groupdsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
            let group = menu.groups[indexPath.item]
            cell.setupCell(group: group.name, isSelected: false)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            let group = menu.groups[selectedGroupIndex]
            let product = group.products[indexPath.item]
            cell.setupCell(product: product)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productsView {
            let noOfCellsInRow = 2.1
            
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            
            let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            
            return CGSize(width: size, height: size)
        }
        return CGSize(width:  collectionView.bounds.width/4, height: collectionView.bounds.height)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 2
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == groupdsCollectionView{
                self.selectedGroupIndex = indexPath.item
                self.groupdsCollectionView.reloadData()
                self.productsView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
                self.productsView.reloadData()
            } else if collectionView == productsView {
                var group = menu.groups[self.selectedGroupIndex]
                var product = group.products[indexPath.item]
        
                let nextViewController = ProductViewController()
                nextViewController.productName = product.name
                nextViewController.items = [Item(mainImageName: ProductContent(imageName: product.image.accessibilityIdentifier ?? "nil"), nestedImagesNames: product.nestedImages, title: product.name), Item(mainImageName: ProductContent(imageName: product.image.accessibilityIdentifier ?? "nil"), nestedImagesNames: product.nestedImages, title: product.name + "color")]
                nextViewController.modalPresentationStyle = .fullScreen
                self.navigationController!.pushViewController(nextViewController, animated: true)
            }
        }
}
