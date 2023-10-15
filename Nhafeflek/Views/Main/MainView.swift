//
//  ContentView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 10/10/2023.
//

import SwiftUI

struct MainView: View {
    
    @State var tab: Tabs = .home
    
    var body: some View {
        TabView(selection: $tab) {
            ForEach(Tabs.allCases, id: \.self){ tab in
                ViewLayout {
                    HeaderView(title: tab == .home ? "NHAFEFLEK" : tab.rawValue.uppercased())
                } content: { edges in
                    tab.view
                }
                .tabItem {
                    VStack{
                        Image(tab.icon)
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        Text(tab.rawValue)
                            .font(.white, .semiBold, 22)
                    }
                }
            }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(Color.hfOrange)
            UITabBar.appearance().backgroundColor = UIColor(Color.hfOrange)
            UITabBar.appearance().standardAppearance = appearance
        }
        .accentColor(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
