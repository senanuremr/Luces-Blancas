//
//  ContentView.swift
//  Luces Blancas
//
//  Created by Senanur EMİR on 3.10.2023.
//


import SwiftUI


struct ContentView: View {
    @State private var currentTab: Tab = .Home

    var body: some View {
        TabView(selection: $currentTab) {
            NavigationView {
                AnaSayfaView()
                    .navigationBarTitle("")
            }
            .tabItem {
                Label("Ana Sayfa", systemImage: "house")
            }
            .tag(Tab.Home)
            
            NavigationView {
                Kategoriler()
                
            }
            .tabItem {
                Label("Kategoriler", systemImage: "magnifyingglass.circle")
            }
            .tag(Tab.Search)
            
            NavigationView {
                FavorilerView()
                    .navigationBarTitle("")
            }
            .tabItem {
                Label("Favoriler", systemImage: "heart")
            }
            .tag(Tab.Cart)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab: String, CaseIterable{
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Cart = "bell"
 
   
    
    var Tabname: String{
        switch self{
        case.Home:
            return ""
        case.Search:
            return ""
        case.Cart:
            return ""
        
            
        }
    }
}


extension View{
    func getSafeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable{
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
