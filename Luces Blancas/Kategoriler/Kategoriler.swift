//
//  Kategoriler.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI

struct Kategoriler: View {
    @State private var search: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                 /*/  HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        TextField("Kategori Yazın", text: $search, onCommit: {
                        })
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .background(Color(.white))
                    .frame(width: 350)
                    .padding(.horizontal)
                    .padding(.top, -75)
                    .edgesIgnoringSafeArea(.top)
                    
                 */
                   
                        
                    NavigationLink(destination: KolyeView()) {
                        ZStack {
                            Image("kategori1")
                                .resizable()
                                .frame(width: 400, height: 230)
                                .aspectRatio(contentMode: .fill)
                                .padding(.top , -20)
                        }
                    }
                    .padding(.horizontal)
                    Spacer().frame(height: 15)
                    
                    NavigationLink(destination: KüpeView()) {
                        ZStack {
                            Image("kategori3")
                                .resizable()
                                .frame(width: 400, height: 230)
                        }
                    }
                    .padding(.horizontal)
                    Spacer().frame(height: 15)
                    
                    NavigationLink(destination: BileklikView()) {
                        ZStack {
                            Image("kategori2")
                                .resizable()
                                .frame(width: 400, height: 230)
                        }
                    }
                    .padding(.horizontal)
                    Spacer().frame(height: 15)
                    
                    NavigationLink(destination: YüzükView()) {
                        ZStack {
                            Image("kategori4")
                                .resizable()
                                .frame(width: 400, height: 230)
                        }
                    }
                    .padding(.horizontal)
                } .padding(.top, -65)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct Kategoriler_Previews: PreviewProvider {
    static var previews: some View {
        Kategoriler()
    }
}
