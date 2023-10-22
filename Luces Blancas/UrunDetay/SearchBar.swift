//
//  SearchView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            TextField("Ara...", text: $text)
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
        .background(Color(.white))
        .frame(width: 350)
    }
}


