//
//  FirebaseAuth.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import Foundation
import FirebaseAuth

final class FirebaseAuth {
    static let shared = FirebaseAuth()
    
    private init() { }
    
    public func getUserId() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    public func getUser() throws -> HFBarber {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        
        return HFBarber(user: user)
    }
    
    @discardableResult
    public func signIn(email: String, password: String) async throws -> HFBarber {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
        return HFBarber(user: authResult.user)
    }
    
    @discardableResult
    public func createUser(email: String, password: String) async throws -> HFBarber {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        return HFBarber(user: authResult.user)
    }
    
    public func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    public func loggout() throws {
        try Auth.auth().signOut()
    }
}
