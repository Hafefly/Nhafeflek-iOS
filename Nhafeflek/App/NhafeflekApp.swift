//
//  NhafeflekApp.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 10/10/2023.
//

import SwiftUI
import HFNavigation
import FirebaseCore

@main
struct NhafeflekApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    private let coordinator = NavigationCoordinator.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
