//
//  ContentView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 10/10/2023.
//

import SwiftUI

struct MainView: View {
    
    @State var tab: Tabs = .home
    
    let shadowImage = UIImage.gradientImageWithBounds(
        bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 10),
        colors: [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.2).cgColor
        ]
    )
    
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
                        Text(tab.rawValue)
                            .font(.white, .semiBold, 22)
                    }
                }
            }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.shadowImage = shadowImage
            appearance.backgroundColor = UIColor(Color.hfOrange)
            UITabBar.appearance().backgroundColor = UIColor(Color.hfOrange)
            UITabBar.appearance().backgroundImage = UIImage(named: "pattern")
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
