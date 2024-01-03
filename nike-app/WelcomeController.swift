//
//  WelcomeController.swift
//  nike-app
//
//  Created by Гость on 25.12.2023.
//

import Foundation
import UIKit

class WelcomeController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    func assignbackground(){
        let background = UIImage(named: "image 3.png")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
       }
   
}

