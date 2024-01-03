//
//  ProductCard.swift
//  nike-app
//
//  Created by Гость on 02.01.2024.
//

import Foundation

import SwiftUI

struct ProductContent {
    var imageName: String
    init(imageName: String){
        self.imageName = imageName
    }
}

struct ProductCard: View {
    
    let content: ProductContent
    var body: some View {
        VStack (alignment: .leading, spacing: 2 ){
            Image(content.imageName)
                .resizable()
                .padding(.horizontal, 20)
                .scaledToFit()
        }
    }
}

struct Item {
    var mainImageName: ProductContent
    var nestedImagesNames: [ProductContent]
    var title: String
}
