//
//  UserRepo.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 16/10/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserRepo {
    
    static let shared = BarberRepo()
    
    private let usersCollection = Firestore.firestore().collection(HFCollection.users.rawValue)
    
    private func userDocument(_ id: String) -> DocumentReference {
        return usersCollection.document(id)
    }
    
    func getUser(_ id: String) async throws -> HFUser {
        return try await userDocument(id).getDocument(as: HFUser.self)
    }
}
