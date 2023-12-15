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
    
    func setupCell(group: Group){
        self.nameGroup.text = group.name
        
    }

}
