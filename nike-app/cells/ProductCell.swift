//
//  ProductCell.swift
//  nike-clone
//
//  Created by andrey on 14.12.2023.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: ImageLoader.AsyncImage<Text>!

    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var descriptionProduct: UILabel!

    @IBOutlet weak var price: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = nil
    }

    func setupCell(product: File.Product){
        self.productImage.url = product.image
        self.productImage.placeholder = "Loading ..."
        self.label.text = product.name
        self.descriptionProduct.text = product.description
        self.price.text = product.price
        
    }
}
