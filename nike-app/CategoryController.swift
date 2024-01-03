//
//  CategoryController.swift
//  nike-app
//
//  Created by Гость on 02.01.2024.
//

import Foundation
import UIKit
class CategoryController: UIViewController {

    @IBOutlet weak var selectorsView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectorsView.register(UINib(nibName: "CategoryViewCell", bundle: nil), forCellReuseIdentifier: "CategoryViewCell")
        
    }
}
