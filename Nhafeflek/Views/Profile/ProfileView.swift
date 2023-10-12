//
//  ProfileView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ViewLayout {
            HeaderView(title: "Profile")
        } content: { edges in
            VStack(spacing: 12){
                HFProfileCard()
                Separator("haircuts history")
                
                ScrollView(showsIndicators: false){
                    ForEach(Order.mockOrders, id: \.id?.hashValue) { order in
                        HaircutCard(order: order)
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
