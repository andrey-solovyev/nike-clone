//
//  NewsProductViewCell.swift
//  nike-app
//
//  Created by Гость on 28.12.2023.
//

import UIKit

class NewsProductViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(image: UIImage, label: String){
        self.label.text = label
        self.imageView.image = image
//        var cellImg : UIImageView = UIImageView(frame: CGRectMake(0, 0, 100, UIScreen.main.bounds.width))
//        cellImg.image = image
//        imageView.addSubview(cellImg)
    }

}
