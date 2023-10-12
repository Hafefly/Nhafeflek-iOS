//
//  Color.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 12/10/2023.
//

import SwiftUI

extension Color {
    public static let primaryColor = Color(red: 0.15, green: 0.15, blue: 0.15)
    public static let hfOrange = Color(red: 0.95, green: 0.39, blue: 0.21)
}

extension Color {
    func lighter(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: abs(percentage))
    }

    func darker(by percentage: CGFloat = 30.0) -> Color {
        return self.adjust(by: -1 * abs(percentage))
    }

    func adjust(by percentage: CGFloat = 30.0) -> Color {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return Color(red: Double(min(red + percentage/100, 1.0)),
                         green: Double(min(green + percentage/100, 1.0)),
                         blue: Double(min(blue + percentage/100, 1.0)),
                         opacity: Double(alpha))
        } else {
            return self
        }
    }
}
