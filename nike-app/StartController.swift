//
//  StartController.swift
//  nike-app
//
//  Created by Гость on 26.12.2023.
//

import Foundation
import UIKit

class StartController: UIViewController {
    @IBOutlet weak var imageView: UICollectionView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    var startSouce = StartSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellWithReuseIdentifier:  "ImageViewCell")
        self.imageView.dataSource = self
        self.imageView.delegate = self
        self.imageView.isUserInteractionEnabled = true
        self.imageView.addSubview(getStartedButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension StartController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return startSouce.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageView.dequeueReusableCell(withReuseIdentifier: "ImageViewCell", for: indexPath) as! ImageViewCell
//        cell?.img.image = startSouce.images[indexPath.row]
        cell.setup(image: startSouce.images[indexPath.row])
        return cell
    }
}

extension StartController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = imageView.bounds
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

