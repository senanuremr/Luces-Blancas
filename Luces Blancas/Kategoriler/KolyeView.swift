//
//  ContentView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI
import Foundation

struct KolyeView: View {
    let products: [Product] = [
        Product(name: "Baby Kolye", imageName: "Kolye1", description: "Bu zarif kolye, stilinize zarif bir dokunuş katmak için tasarlandı.Kişiselleştirilebilen özel harf seçenekleri ile sizin için özel hale getirilebilir."),
        Product(name: "Renkli Taş Kelebek Kolye",  imageName: "Kolye2", description: "Özenle seçilmiş kelebek charmın yarattığı kolyemizi diğerlerinden farklı olarak parlamasını seveceksiniz."),
        Product(name: "Mıknatıslı Aşk Kolye",  imageName: "Kolye3", description: "Mıknatıslı Aşk Kolye, aşkın çekim gücünü sembolize eden ve duygusal bağları güçlendiren zarif bir takıdır.."),
        Product(name: "İnci Prenses Kolye",  imageName: "Kolye4", description: "İnci Prenses Kolye, gerçek incilerle tasarlanmış, zarif ve etkileyici bir takı parçasıdır. Her anı daha özel ve şık kılmak için mükemmel bir seçenek"),
        Product(name: "Kalp Kolye",  imageName: "Kolye5", description: "Kalp Kolye, sevgi ve duyguların sembolü olan zarif bir takıdır. Sevdiklerinize olan sevginizi ifade etmek veya kendinizi özel hissetmek için mükemmel bir tercihtir."),
        Product(name: "Anka Kuşu Kolye",  imageName: "kolye6", description: "Anka Kuşu Kolye, efsanevi Anka kuşunun özgürlüğü ve yeniden doğuşu sembolize eden zarif bir takıdır. Bu eşsiz kolye, güzellik ve özgünlüğü vurgulayan bir stil ifadesi sunar."),
        Product(name: "Yılan Kolye",  imageName: "kolye7", description: "Yılan Kolye, gizem ve çekiciliği simgeleyen zarif bir takıdır. Yılan figürü, cesaret ve değişimle ilişkilendirilen bir sembol olup, bu kolyeyle özgünlüğünüzü vurgulayabilirsiniz."),
        Product(name: "5'li Kelebek Kolye",  imageName: "kolye8", description: "5'li Kelebek Kolye, zarif ve çarpıcı bir tasarıma sahip özel bir takıdır. Beş adet kelebek figürü, özgürlük, dönüşüm ve güzellik temalarını temsil eder.")
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



    struct KolyeView_Previews: PreviewProvider {
        static var previews: some View {
            KolyeView()
        }
    }
