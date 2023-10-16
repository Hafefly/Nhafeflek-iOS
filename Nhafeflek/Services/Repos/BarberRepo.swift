//
//  UserRepo.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 16/10/2023.
//

import Foundation
import FirebaseFirestore

enum HFCollection: String {
    case users
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
    
    func createBarber(_ barber: HFBarber) throws {
        guard let id = barber.id else {
            throw URLError(.badURL)
        }
        
        return try barberDocument(id).setData(from: barber)
    }
    
    func updateBarber(_ barber: HFBarber) throws {
        try self.createBarber(barber)
    }
    
    func getBarber(_ id: String) async throws -> HFBarber {
        return try await self.barberDocument(id).getDocument(as: HFBarber.self)
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
