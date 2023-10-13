//
//  Tabs.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import SwiftUI

enum Tabs: String, Hashable, CaseIterable {
    case home = "Home"
    case calendar = "Calendar"
    case profil = "Profile"
    
    var view: AnyView {
        switch self {
        case .home: return AnyView(AppointmentsView())
        case .calendar: return AnyView(CalendarView())
        case .profil: return AnyView(ProfileView())
        }
    }
    
    var icon: String {
        return "ic_\(rawValue.lowercased())"
    }
}
