//
//  SplashViewModel.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import Foundation
import HFNavigation
import FirebaseAuth

extension SplashView {
    class Model: ObservableObject {
        
        init() {
            self.getMe()
        }
        
        func getMe(){
            if nil != FirebaseAuth.shared.getUserId() {
                NavigationCoordinator.shared.switchStartPoint(MainView())
            } else {
                NavigationCoordinator.shared.switchStartPoint(LoginView())
            }
        }
        
    }
}
