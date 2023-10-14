//
//  ActivationView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import SwiftUI

struct ActivationView: View {
    var body: some View {
        ViewLayout {
            HeaderView(title: "activate account")
        } content: { edges in
            VStack{
                Text("please head to our headquartered  to activate your account")
                    .font(.primaryColor, .semiBold, 12)
                    .frame(width: .infinity)
                    .background(Color.white)
                VStack(alignment: .leading){
                    Text("account informations")
                        .font(.primaryColor, .semiBold, 20)
                    VStack{
                        Text("fullname")
                            .font(.primaryColor, .medium, 16)
                        Text("Samy Abderraouf Mehdid")
                            .font(.white, .semiBold, 16)
                            .padding(16)
                            .frame(width: .infinity)
                            .cornerRadius(6)
                    }
                }
                Spacer()
            }
            .padding(16)
            .background(
                ZStack{
                    Image("BackgroundImage")
                        .blur(radius: 6)
                    LinearGradient.hfGradient
                }
                .ImagePattern()
            )
        }
    }
}
