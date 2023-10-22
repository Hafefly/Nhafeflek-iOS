//
//  SplashView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import SwiftUI
import HFCoreUI

struct SplashView: View {
    @StateObject private var model = Model()
    var body: some View {
        VStack{
            Spacer()
            Image("logo_hafefly_white")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 32)
            Spacer()
            Spacer()
            Text("RAYNMORE™")
                .font(.white, .semiBold, 20)
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

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
