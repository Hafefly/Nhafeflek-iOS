//
//  HFButton.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

struct HFButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Spacer()
            configuration.label
            Spacer()
        }
        .padding(.vertical, 12)
        .background(Color.accentColor)
        .cornerRadius(12)
    }
}
