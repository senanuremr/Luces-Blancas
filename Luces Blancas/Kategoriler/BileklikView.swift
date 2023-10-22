//
//  BileklikView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI
import Foundation

struct BileklikView: View {
   
    
    let products: [Product] = [
        Product(name: "Arı Charm Bileklik", imageName: "bileklik1", description: "Arı Charm Bileklik, doğayı ve doğal yaşamı sevenler için mükemmel bir seçenektir."),
        Product(name: "Fil İncili Bileklik", imageName: "bileklik2", description: "Fil İncili Bileklik, zarif ve etkileyici bir tasarıma sahip olan bu bileklik, fil figürü ve doğal inci incileriyle dikkat çeker.Doğal inci incileri ise saflık ve zarafeti temsil eder."),
        Product(name: "Harf Bileklik", imageName: "bileklik3", description: "Harf Bileklik, kişiselleştirilmiş takıları sevenler için mükemmel bir seçenektir. Bu zarif bileklik, seçeceğiniz harfle özelleştirilmiştir"),
        Product(name: "Charm Bileklik", imageName: "bileklik8", description: "Charm Bileklik, zarif ve özgün bir aksesuardır. Bu bileklik, çeşitli şık ve anlamlı charm'larla süslenmiştir ve her biri farklı bir anlam taşır."),
        Product(name: "Donut Bileklik", imageName: "bileklik5", description: "Donut Bileklik, eğlenceli ve renkli tasarımı ile dikkat çeken bir aksesuardır. İnce halkaların bir araya gelerek oluşturduğu bu bileklik, enerjik ve neşeli bir görünüm sunar."),
        Product(name: "Kalp Charm Bileklik", imageName: "bileklik6", description: "Kalp Charm Bileklik, aşk ve sevgiyi sembolize eden zarif bir takıdır. İnci, taş veya değerli metallerle süslenmiş olan bu bileklik, özel anlarınıza romantik bir dokunuş katmak için tasarlanmıştır. "),
        Product(name: "Kelebek Bileklik", imageName: "bileklik7", description: "Kelebek Bileklik, özgürlük ve dönüşümün sembolü olan zarif bir takıdır. Hafif ve zarif tasarımıyla dikkat çeken bu bileklik, kelebek figürü ile doğanın güzelliklerini yansıtır. Kelebekler, yaşamın değişkenliğini ve transformasyonu temsil ederler. "),
        Product(name: "Prenses Bileklik", imageName: "bileklik4", description: "Prenses Bileklik, zarif ve asil bir tarza sahip olanların tercih ettiği şık bir takıdır. İnce ve detaylı tasarımıyla dikkat çeken bu bileklik, prenseslerin zarafetini yansıtır."),
        Product(name: "Baget Bileklik", imageName: "bileklik11", description: "Baget Bileklik, modern ve sofistike bir tarza sahip olanların tercih ettiği şık bir takıdır. Baget kesim taşlar veya elmaslarla süslenmiş olan bu bileklik, zarafet ve lüksün bir ifadesidir."),


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
struct BileklikView_Previews: PreviewProvider {
    static var previews: some View {
        BileklikView()
    }
}
