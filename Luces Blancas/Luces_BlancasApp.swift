//
//  Luces_BlancasApp.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//

import SwiftUI

@main
struct YourApp: App {
    let productStore = ProductStore() // ProductStore örneği oluşturun ve paylaşın

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(productStore) // ProductStore'u çevresel nesne olarak paylaşın
        }
    }
}
