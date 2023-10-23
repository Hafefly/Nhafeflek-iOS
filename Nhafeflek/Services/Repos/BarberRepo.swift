//
//  UserRepo.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 16/10/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import HFCoreModel

enum HFCollection: String {
    case clients
    case barbers
    case barbershops
    case history
    case reviews
    case favorites
    case orders
}

class BarberRepo {
    static let shared = BarberRepo()
    
    let barberCollection = Firestore.firestore().collection(HFCollection.barbers.rawValue)
    
    private func barberDocument(_ id: String) -> DocumentReference {
        return barberCollection.document(id)
    }
    
    private func ordersCollection(_ id: String) -> CollectionReference {
        return barberDocument(id).collection(HFCollection.orders.rawValue)
    }
    
    func createBarber(_ user: User) throws {
        
        let barber = Barber(profileImage: user.photoURL?.absoluteString, fullname: user.displayName ?? "", email: user.email ?? "", experience: 0, haircutsDone: 0, isAvailableToHome: true, phoneNumber: user.phoneNumber, verified: false)
        
        return try barberDocument(user.uid).setData(from: barber)
    }
    
    func updateBarber(_ barber: Barber) throws {
        guard let id = barber.id else {
            throw URLError(.badURL)
        }
        
        return try barberDocument(id).setData(from: barber)
    }
    
    func getBarber(_ id: String) async throws -> Barber {
        return try await self.barberDocument(id).getDocument(as: Barber.self)
    }
    
    func addListenerForOrdersReferences(_ id: String, completion: @escaping ([String]) -> Void) {
        self.ordersCollection(id).addSnapshotListener { snapshot, error in
            if nil != error {
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("no element")
                return
            }
            
            let ids = documents.compactMap({ try? $0.data(as: 
                    String.self) })
            
            completion(ids)
        }
    }
    
    func getBarberOrderHaistory(_ id: String) async throws -> [Order] {
        guard let docIds = try self.decodeDocuments(try await self.ordersCollection(id).getDocuments(), as: OrderReference.self).map({ $0.id }) as? [String] else {
            throw URLError(.badURL)
        }
        
        return try await OrderRepo.shared.getOrders(withIds: docIds)
    }
    
    func decodeDocuments<T: Decodable>(_ snapshots: QuerySnapshot, as type: T.Type) throws -> [T] {
        var decodedData = [T]()
                
        for document in snapshots.documents {
            if let data = try? document.data(as: type) {
                decodedData.append(data)
            }
        }
                
        return decodedData
    }
}
