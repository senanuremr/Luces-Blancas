//
//  Product.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI
import Foundation

struct Product: Identifiable, Codable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
    var isFavorite: Bool = false
    

    init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
    }
}


class ProductStore: ObservableObject {
    @Published var favoriteProducts: [Product] = []

    init() {
        loadFavorites() 
    }

    func addToFavorites(_ product: Product) {
        favoriteProducts.append(product)
        saveFavorites()
    }

    func removeFromFavorites(_ product: Product) {
        if let index = favoriteProducts.firstIndex(where: { $0.id == product.id }) {
            favoriteProducts.remove(at: index)
            saveFavorites()
        }
    }

    func isFavorite(_ product: Product) -> Bool {
          return favoriteProducts.contains { $0.id == product.id }
      }

    private func saveFavorites() {
           // Favori ürünleri UserDefaults'a kaydet
           if let encodedData = try? JSONEncoder().encode(favoriteProducts) {
               UserDefaults.standard.set(encodedData, forKey: "favoriteProducts")
           }
       }

    private func loadFavorites() {
            // UserDefaults'tan favori ürünleri çek
            if let savedData = UserDefaults.standard.data(forKey: "favoriteProducts"),
               let loadedProducts = try? JSONDecoder().decode([Product].self, from: savedData) {
                favoriteProducts = loadedProducts
            }
        }
    }
