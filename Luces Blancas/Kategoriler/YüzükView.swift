//
//  YüzükView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//


import SwiftUI
import Foundation

struct YüzükView: View {
    let products: [Product] = [
        Product(name: "Kalp Yüzük", imageName: "yüzük2", description: "Kalp Yüzük, aşk ve romantizmin sembolüdür. Bu zarif yüzük, bir kalbin güzellik ve sevgiyle dolu olduğunu temsil eder. Kalp şeklindeki tasarımıyla duygusal bir bağlantı oluşturur"),
        Product(name: "Çift Yüzük", imageName: "yüzük3", description: "Çift Yüzük, iki kişi arasındaki özel bağı ve birliği sembolize eder. Bu özel tasarım, sevgililer, nişanlılar veya evli çiftler için mükemmel bir seçenektir."),
        Product(name: "Palmiye Yüzük", imageName: "yüzük4", description: "Palmiye Yüzük, zarif ve benzersiz bir tasarıma sahiptir. İnce dalları ve zarif yapraklarıyla palmiye ağacının sembolünü taşır."),
        Product(name: "Taş Kalp Yüzük", imageName: "yüzük5", description: "Taş Kalp Yüzük, sevgi ve romantizmi simgeleyen bir mücevherdir. Bu zarif yüzük, kalp şeklindeki taşıyla göz alıcı bir görünüme sahiptir."),
        Product(name: "Smile Yüzük", imageName: "yüzük1", description: "Smile Yüzük, pozitif enerjiyi ve neşeyi yansıtan eğlenceli bir mücevherdir. Bu yüzük, gülümseyen bir yüzü andıran tasarımıyla dikkat çeker."),

        
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
struct YüzükView_Previews: PreviewProvider {
    static var previews: some View {
        YüzükView()
    }
}

