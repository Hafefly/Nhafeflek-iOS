//
//  ProfileView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isEditing = false
    
    @State private var firstnameValue = "Samy Abderraouf"
    @State private var lastnameValue = "Mehdid"
    @State private var barbershopValue = "Fasta La"
    @State private var openingTime = Date()
    @State private var closingDate = Date()
    
    @State private var isAvailableHome = true
    
    var body: some View {
        VStack(spacing: 12){
            
            hfProfileCard()
            
            Separator("haircuts history")
            
            if !isEditing {
                ScrollView(showsIndicators: false){
                    ForEach(Order.mockOrders, id: \.id?.hashValue) { order in
                        HaircutCard(order: order)
                    }.padding(.bottom)
                }
            }
        }
        .padding(.top, 16)
    }
    
    @ViewBuilder
    private func hfProfileCard() -> some View {
        ZStack {
            if !isEditing {
                HStack{
                    Image("BarberPicture")
                        .resizable()
                        .frame(width: 92, height: 149)
                        .tag("BarberPicture")
                    
                    VStack(alignment: .leading, spacing: 6){
                        Text(firstnameValue + " " + lastnameValue)
                            .font(.primaryColor, .bold, 14)
                        Text(barbershopValue)
                            .font(.primaryColor, .bold, 14)
                        Text("5 years of experince")
                            .font(.primaryColor.opacity(0.5), .regular, 12)
                        
                        Spacer()
                        
                        if isAvailableHome {
                            Button {
                                
                            } label: {
                                HStack{
                                    Spacer()
                                    Text("home")
                                        .font(.white, .semiBold, 10)
                                    Spacer()
                                    Image("ic_home_white")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                }
                                .padding(.horizontal, 8)
                                .frame(width: 100, height: 24)
                                .background(Color.hfOrange)
                                .cornerRadius(4)
                            }
                        }
                        
                        Button {
                            withAnimation {
                                self.isEditing = true
                            }
                        } label: {
                            HStack{
                                Spacer()
                                Text("edit profile")
                                    .font(.white, .semiBold, 8)
                                Spacer()
                                Image("ic_profile_white")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                            }
                            .padding(.horizontal, 8)
                            .frame(width: 100, height: 24)
                            .background(Color.primaryColor)
                            .cornerRadius(4)
                        }
                    }
                    .padding(.vertical, 4)
                    .padding(.top, 4)
                    
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
                .fixedSize(horizontal: false, vertical: true)
            } else {
                VStack {
                    Image("BarberPicture")
                        .resizable()
                        .frame(width: 92, height: 149)
                        .tag("BarberPicture")
                        .overlay(Color.primaryColor.opacity(0.8))
                        .overlay(Image("ic_camera_white"))
                        .cornerRadius(12)
                        .shadow(radius: 4)
                    
                    elementModifier(label: "firstname", disabled: true) {
                        TextField("firstname", text: $firstnameValue)
                            .multilineTextAlignment(.trailing)
                            
                    }
                    
                    elementModifier(label: "lastname", disabled: true) {
                        TextField("lastname", text: $lastnameValue)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    elementModifier(label: "barbershop name", disabled: true) {
                        TextField("barbershop name", text: $barbershopValue)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    elementModifier(label: "works from") {
                        DatePicker("", selection: $openingTime, displayedComponents: .hourAndMinute)
                            .preferredColorScheme(.dark)
                    }
                    
                    elementModifier(label: "works to") {
                        DatePicker("", selection: $closingDate, displayedComponents: .hourAndMinute)
                            .preferredColorScheme(.dark)
                    }
                    
                    elementModifier(label: "social media") {
                        HStack(spacing: 12){
                            Image("ic_facebook_white2")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Image("ic_instagram_white")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Image("ic_snapchat_white")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    
                    elementModifier(label: "available home") {
                        Toggle("", isOn: $isAvailableHome)
                    }
                    
                    HStack {
                        Spacer()
                        Button("cancel") {
                            withAnimation {
                                self.isEditing = false
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.primaryColor)
                        .cornerRadius(6)
                        
                        Button("save") {
                            withAnimation {
                                self.isEditing = false
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.hfOrange)
                        .cornerRadius(6)
                    }
                }
                .background(
                    Image("pattern2")
                        .opacity(0.2)
                )
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func elementModifier<T: View>(label: String, disabled: Bool = false, value: () -> T) -> some View {
        HStack {
            Text(label)
                .font(.white, .bold, 16)
            Spacer()
            
            value()
                .foregroundColor(disabled ? .white.opacity(0.6) : .white)
        }
        .disabled(disabled)
        .padding(16)
        .frame(maxHeight: 50)
        .background(Color.primaryColor)
        .cornerRadius(8)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tab: .profil)
    }
}
