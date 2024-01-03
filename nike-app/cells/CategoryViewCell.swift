//
//  CategoryViewCell.swift
//  nike-app
//
//  Created by Гость on 02.01.2024.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(isSelect: Bool, label: String){
        self.selectButton.isSelected=isSelect
        self.label.text = label
    }

}
