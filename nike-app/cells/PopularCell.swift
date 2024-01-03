//
//  PopularCell.swift
//  nike-app
//
//  Created by Гость on 23.12.2023.
//

import UIKit

class PopularCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
    
    func setupCell(popularTopic: PopularTopic){
        self.label.text = popularTopic.label
        self.image.image = popularTopic.image
    }
}
