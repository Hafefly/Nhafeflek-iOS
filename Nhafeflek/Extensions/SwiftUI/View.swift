//
//  View.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
    
    func backgroundPattern(scale: Double) -> some View {
        self.overlay(
            Image("pattern")
                .resizable()
                .scaleEffect(scale)
                .opacity(0.06)
        )
    }
    
    func pattern() -> some View {
        self.overlay(
            Image("pattern")
                .opacity(0.1)
        )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
