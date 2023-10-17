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
    
    func ImagePattern() -> some View {
        self.overlay(
            Image("pattern")
                .resizable()
                .scaledToFill()
                .opacity(0.06)
        )
    }
    
    func titlePattern() -> some View {
        self.overlay(
            Image("pattern")
                .resizable()
                .scaledToFill()
                .opacity(0.1)
        )
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
    public func textFieldFocusableArea() -> some View {
        TextFieldButton { self.contentShape(Rectangle()) }
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
