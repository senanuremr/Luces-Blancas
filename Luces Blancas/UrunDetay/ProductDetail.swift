//
//  ProductDetail.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//


import SwiftUI

struct ProductDetail: View {
    @EnvironmentObject var productStore: ProductStore
    let product: Product
    @State private var isFavorite: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(product.imageName)
                .resizable()
                .frame(width: 400, height: 400)
                .cornerRadius(10)
                .shadow(radius: 5)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 5, height: 5)
                }
                .padding()
            }
            .background(Color.black.opacity(0.5))
            .cornerRadius(20)
            .padding(20)

            VStack {
                Spacer()
                HStack { // Ürün adı ve kalp butonunu yatayda hizalamak için HStack kullanın
                    Text(product.name)
                        .font(.largeTitle)
                        .padding(.bottom, 0)

                    Button(action: {
                        isFavorite.toggle()
                        if isFavorite {
                            productStore.addToFavorites(product)
                        } else {
                            productStore.removeFromFavorites(product)
                        }
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .pink : .gray)
                            .font(.title)
                            .padding(.leading, 5) // Ürün adı ile kalp butonu arasındaki boşluğu ayarlayın
                    }
                }
              
                Text(product.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 170)
            .padding(.leading)

        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: EmptyView())
        .onAppear {
            // İlgili ürünün favori durumunu kontrol et
            isFavorite = productStore.isFavorite(product)
        }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProduct = Product(name: "Ürün Adı", imageName: "urun_resmi", description: "Ürün açıklaması burada yer alacak.")
        return NavigationView {
            ProductDetail(product: sampleProduct)
        }
    }
}
