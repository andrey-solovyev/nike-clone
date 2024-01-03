//
//  ImageViewCell.swift
//  nike-app
//
//  Created by Гость on 27.12.2023.
//

import UIKit

class ImageViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: UIImage){
        imageView.image = image
    }

}
