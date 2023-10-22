//
//  ProductCard.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    @EnvironmentObject var productStore: ProductStore

    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            
            HStack {
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(Color(.black))
                
                Button(action: {
                    if productStore.isFavorite(product) {
                        productStore.removeFromFavorites(product)
                    } else {
                        productStore.addToFavorites(product)
                    }
                }) {
                    Image(systemName: productStore.isFavorite(product) ? "heart.fill" : "heart")
                        .foregroundColor(productStore.isFavorite(product) ? .pink : .gray)
                        .font(.title)
                        
                }
            }
        }
        .padding()
        .frame(width: 200, height: 250) // Çerçeve boyutlarını burada ayarlayın
    }
}
