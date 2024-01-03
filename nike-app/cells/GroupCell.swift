//
//  GroupCell.swift
//  nike-clone
//
//  Created by andrey on 15.12.2023.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var nameGroup: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let underlineAttributedString = NSAttributedString(string: self.nameGroup.text!, attributes: [:])
        self.nameGroup.attributedText = underlineAttributedString
    }
    
    func setupCell(group: String, isSelected: Bool){
        self.nameGroup.text = group
        if isSelected{
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
            let underlineAttributedString = NSAttributedString(string: group, attributes: underlineAttribute)
            self.nameGroup.attributedText = underlineAttributedString
        } else {
            let underlineAttributedString = NSAttributedString(string: group, attributes: [:])
            self.nameGroup.attributedText = underlineAttributedString
        }
    }

}
