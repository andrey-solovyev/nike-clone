//
//  ProductsViewController.swift
//  nike-clone
//
//  Created by andrey on 14.12.2023.
//
import UIKit
import Foundation

class ProductsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var groupdsCollectionView: UICollectionViewCell!
    var menu: Menu = Menu()
    var selectedGroupIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier:  "ProductCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

}
extension ProductsViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == groupdsCollectionView{
            return menu.groups.count
        } else {
            let group = menu.groups[selectedGroupIndex]
            return group.products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        if collectionView == groupdsCollectionView{
            return menu.groups.count
        } else {
            let group = menu.groups[selectedGroupIndex]
            return group.products.count
        }        let product = menu.products[indexPath.item]
        cell.setupCell(product:product)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  collectionView.bounds.width/2, height: collectionView.bounds.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
