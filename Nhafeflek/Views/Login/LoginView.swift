//
//  LoginView.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 32){
            Spacer()
            Image("logo_hafefly_white")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 32)
            Spacer()
            VStack(spacing: 16){
                TextField("email", text: $email)
                    .textFieldStyle(HFAuthTextFieldStyle())
                SecureField("password", text: $password)
                    .textFieldStyle(HFAuthTextFieldStyle())
            }
            Separator("or")
            HStack(spacing: 64){
                ForEach(AuthProvider.allCases, id: \.hashValue) { provider in
                    Button {
                        //
                    } label: {
                        provider
                            .icon
                    }
                }
            }
            
            Spacer()
            
            Button("Sign In") {
                //
            }
            .buttonStyle(HFButtonStyle())
        }
        .padding(16)
        .background(
            ZStack{
                Image("BackgroundImage")
                    .blur(radius: 10)
                LinearGradient.hfGradient
            }
                .ImagePattern()
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
