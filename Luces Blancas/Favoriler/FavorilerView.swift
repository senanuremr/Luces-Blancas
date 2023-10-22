//
//  FavorilerView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI

struct FavorilerView: View {
    @EnvironmentObject var productStore: ProductStore // ProductStore'u çevresel nesne olarak alıyoruz

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Favori Ürünler")) {
                    ForEach(productStore.favoriteProducts) { product in
                        NavigationLink(destination: ProductDetail(product: product)) {
                            ProductRow(product: product)
                        }
                    }
                }
            }.padding(.top, -90)
            .listStyle(InsetGroupedListStyle())
        }
       
    }
}

struct FavorilerView_Previews: PreviewProvider {
    static var previews: some View {
        FavorilerView()
            .environmentObject(ProductStore()) // ProductStore çevresel nesnesini ekleyin
    }
}

struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            
            Text(product.name)
                .font(.headline)
        }
    }
}
