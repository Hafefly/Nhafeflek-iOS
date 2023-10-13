//
//  LoginViewModel.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import Foundation
import HFNavigation

extension LoginView {
    class Model: ObservableObject {
        
        @Published public var emailUiState: UiState<String> = .idle
        @Published public var passwordUiState: UiState<String> = .idle
        
        func login(email: String, password: String) {
            Task {
                do {
                    try await FirebaseAuth.shared.signIn(email: email, password: password)
                    NavigationCoordinator.shared.switchStartPoint(MainView(tab: .home))
                    
                } catch {
                    self.emailUiState = .failed(error.localizedDescription)
                    self.passwordUiState = .failed(error.localizedDescription)
                }
            }
        }
        
        func signup() {
//            NavigationCoordinator.pushScreen(SignUpInfoView())
        }
    }
}
