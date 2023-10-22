//
//  SignBarbershopView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import SwiftUI
import HFCoreUI

struct AdmissionView: View {
    var body: some View {
        ViewLayout {
            HeaderView(title: "GET A BARBERSHOP")
        } content: { edges in
            VStack{
                Spacer()
                Image("qr_code")
                    .resizable()
                    .frame(width: 284, height: 284)
                Spacer()
                Spacer()
                Text("show this to your barbershop, as soon as he scans it your are added automatically as one of his barbers™")
                    .font(.primaryColor, .medium, 20)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
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
