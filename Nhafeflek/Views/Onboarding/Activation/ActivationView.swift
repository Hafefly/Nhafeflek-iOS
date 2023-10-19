//
//  ActivationView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import SwiftUI
import HFCoreModel

struct ActivationView: View {
    private let barber: Barber
    
    init(barber: Barber) {
        self.barber = barber
    }
    
    var body: some View {
        ViewLayout {
            HeaderView(title: "activate account")
        } content: { edges in
            VStack{
                Text("please head to our headquartered to activate your account")
                    .font(.primaryColor, .semiBold, 12)
                    .frame(width: .infinity)
                    .background(Color.white)
                VStack(alignment: .leading){
                    Text("account informations")
                        .font(.primaryColor, .semiBold, 20)
                    informationPanel(label: "fullname", value: barber.firstname + " " + barber.lastname)
                    if let barbershopName = barber.barbershopName {
                        informationPanel(label: "barbershop name", value: barbershopName)
                    }
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(8)
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
    
    @ViewBuilder
    private func informationPanel(label: String, value: String) -> some View {
        VStack{
            Text(label)
                .font(.primaryColor, .medium, 16)
            Text(value)
                .font(.white, .semiBold, 16)
                .padding(16)
                .frame(width: .infinity)
                .background(Color.primaryColor)
                .cornerRadius(6)
        }
    }
}
