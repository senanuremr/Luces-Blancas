//
//  AnaSayfaView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI

struct AnaSayfaView: View {
    @State private var currentPage = 0
    @State private var selectedProduct: Product?
    
    let imageNames = ["Ko-9","slider2"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    TabView(selection: $currentPage) {
                        ForEach(0..<imageNames.count, id: \.self) { index in
                            Image(imageNames[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 200)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 200)
                    
                  
                    ZStack {
                        Image("anasayfa")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                            .onTapGesture {
                            }.padding(.top, 230)
                        
                        HStack {
                            NavigationLink(destination: KüpeView()) {
                                   Image("küpe5")
                                       .resizable()
                                       .frame(width: 100, height: 100)
                               }

                    
                            NavigationLink(destination: KolyeView()) {
                                   Image("Kolye5")
                                       .resizable()
                                       .frame(width: 100, height: 100)
                               }
                            
                            NavigationLink(destination: BileklikView()) {
                                   Image("bileklik3")
                                       .resizable()
                                       .frame(width: 100, height: 100)
                               }                        } .padding(.bottom, -25)
                          .padding(.leading, -10)
                
                        HStack {
                            NavigationLink(destination: KolyeView()) {
                                   Image("kolye6")
                                       .resizable()
                                       .frame(width: 100, height: 100)
                               }
                           
                            
                            NavigationLink(destination: YüzükView()) {
                                   Image("yüzük2")
                                       .resizable()
                                       .frame(width: 100, height: 100)
                               }
                            NavigationLink(destination: KüpeView()) {
                                   Image("küpe6")
                                       .resizable()
                                       .frame(width: 100, height: 100)
                               }
                        } .padding(.top, 250)
                          .padding(.leading, -10)
                        
                    }
                    .frame(width: 300, height: 200)
                    
                    VStack {
                        Image("feedback")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 670, height: 670)
                    }.padding(.top, 85)
                }.padding(.top, -130)
            }
        }
    }
}





struct AnaSayfaView_Previews: PreviewProvider {
    static var previews: some View {
        AnaSayfaView()
    }
}

struct ImageSlider: View {
    @Binding var value: Double
    var images: [String]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .cornerRadius(8)
                        .offset(x: CGFloat(index) * geometry.size.width)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .offset(x: -CGFloat(value) * geometry.size.width)
            .gesture(DragGesture()
                        .onChanged({ newValue in
                            value = Double(newValue.translation.width / geometry.size.width) * -1.0
                        }))
        }
        .frame(height: 200)
    }
}
