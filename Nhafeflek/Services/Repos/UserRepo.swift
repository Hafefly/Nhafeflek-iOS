//
//  UserRepo.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 16/10/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import HFCoreModel

class ClientRepo {
    
    static let shared = BarberRepo()
    
    private let usersCollection = Firestore.firestore().collection(HFCollection.clients.rawValue)
    
    private func userDocument(_ id: String) -> DocumentReference {
        return usersCollection.document(id)
    }
    
    func getUser(_ id: String) async throws -> Client {
        return try await userDocument(id).getDocument(as: Client.self)
    }
}
