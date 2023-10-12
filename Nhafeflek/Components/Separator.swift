//
//  Separator.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

struct Separator: View {
    private let text: String?
    private let color: Color
    
    init(_ text: String? = nil, color: Color = .white) {
        self.text = text
        self.color = color
    }
    
    var body: some View {
        HStack(spacing: 0){
            Rectangle()
                .frame(height: 3)
                .foregroundColor(color)
            if let text = text {
                Text(text)
                    .font(color, .semiBold, 18)
                    .lineLimit(1)
                    .padding(.horizontal, 12)
            }
            Rectangle()
                .frame(height: 3)
                .foregroundColor(color)
        }
    }
}

struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        Separator("or")
    }
}
