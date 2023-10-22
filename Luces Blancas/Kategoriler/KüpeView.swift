//
//  KüpeView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI
import Foundation

struct KüpeView: View {
    let products: [Product] = [
        Product(name: "Kelebek Küpe", imageName: "küpe6", description: "Kelebek Küpe, zarif ve şık bir aksesuar olarak her tarza ve her yaşa hitap eder. Bu özel tasarım, kelebek figürünün zarafetini ve hafifliğini yansıtarak sizi daha çekici ve şık bir seçenektir. "),
        Product(name: "Ghost Küpe", imageName: "küpe5", description: "Ghost Küpe, sıradışı ve gizemli bir tarz arayanlar için ideal bir seçenektir. Bu tasarım, zarif ve minimalist bir yaklaşımı benimseyerek sade ve şık bir görünüm sunar."),
        Product(name: "Küpe Set", imageName: "küpe3", description: "Küpe Set, farklı stillerde ve tasarımlarda uyumlu küpeleri bir araya getirir. Bu set, günlük veya özel günlerde farklı kombinasyonlar oluşturmanıza olanak tanır."),
        Product(name: "Çengel Küpe", imageName: "küpe4", description: "Çengel küpe, klasik ve zarif bir tasarıma sahiptir. İnce detayları ve şık görünümü ile her türlü kıyafetle mükemmel bir uyum sağlar. Gündelik kullanım veya özel günler için ideal bir tercihtir."),
        Product(name: "Halka Küpe", imageName: "küpe7", description: "Halka küpe, minimal ve modern bir tasarıma sahiptir. Şık ve zarif bir görünüm sunar ve her türlü kıyafetle kolayca kombinlenebilir. Halka küpeler, günlük kullanım için mükemel bir seçenektir"),
        Product(name: "Smile Küpe", imageName: "küpe1", description: "Smile küpe, neşeli ve pozitif bir ifade sunan sevimli bir tasarıma sahiptir. Bu küpeler, günlük stilinize neşe katacak ve gülümsemeleri herkese yayacaktır."),
    

    ]

    @State private var searchText: String = ""

    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { product in
                return product.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 1) {
                        ForEach(filteredProducts) { product in
                            NavigationLink(destination: ProductDetail(product: product)) {
                                ProductCard(product: product)
                                    .frame(height: 230)
                            }
                        }
                    }
                    .padding(.horizontal, 25)
                }
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing: searchBar)
          

        }
    
    private var searchBar: some View {
        HStack {
            TextField("Ara...", text: $searchText)
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            
            Image(systemName: "magnifyingglass")
                .padding(.trailing)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
        .background(Color(.white))
        .frame(width: 350)
    }

}

struct  KüpeView_Previews: PreviewProvider {
    static var previews: some View {
        KüpeView()
    }
}
