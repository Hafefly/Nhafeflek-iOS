//
//  HFProfileCard.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

struct HFProfileCard: View {
    var body: some View {
        HStack{
            Image("BarberPicture")
                .resizable()
                .frame(width: 92, height: 149)
            
            VStack(alignment: .leading){
                Text("Barber name")
                    .font(.primaryColor, .bold, 20)
                Text("Barbershop name")
                    .font(.primaryColor, .bold, 14)
                Text("5 years of experince")
                    .font(.primaryColor.opacity(0.5), .regular, 12)
                Spacer()
                    .frame(height: 30)
                Button {
                    
                } label: {
                    HStack{
                        Text("available home")
                            .font(.white, .semiBold, 8)
                        Image("ic_home_white")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    .frame(width: 100, height: 24)
                    .background(Color.hfOrange)
                    .cornerRadius(4)
                }
                
                Button {
                    
                } label: {
                    HStack{
                        Text("edit profile")
                            .font(.white, .semiBold, 8)
                        Image("ic_profile_white")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                    .frame(width: 100, height: 24)
                    .background(Color.primaryColor)
                    .cornerRadius(4)
                }
            }
            
            Spacer()
            VStack{
                Image("ic_facebook_dark")
                    .resizable()
                    .frame(width: 24, height: 24)
                Image("ic_instagram_dark")
                    .resizable()
                    .frame(width: 24, height: 24)
                Image("ic_snapchat_dark")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct HFProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HFProfileCard()
            Spacer()
        }
    }
}
