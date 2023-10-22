//
//  OrderRepo.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 16/10/2023.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import HFCoreModel

class OrderRepo {
    static let shared = OrderRepo()
    
    private let ordersCollection = Firestore.firestore().collection(HFCollection.orders.rawValue)
    
    func getOrder(_ id: String) async throws -> Order {
        return try await ordersCollection.document(id).getDocument(as: Order.self)
    }
    
    private func updateOrder(order: Order, timeIntervals: [OrderInterval]) throws -> String {
        guard let id = order.id else {
            throw URLError(.badURL)
        }
        
        var modifierOrder = order
        
        modifierOrder.intervals = timeIntervals
        
        let reference = ordersCollection.document(id)
        try reference.setData(from: modifierOrder)
        return reference.documentID
    }
    
    func getOrders(withIds ids: [String]) async throws -> [Order] {
        guard !ids.isEmpty else {
            return []
        }
        
        return try self.decodeDocuments(try await ordersCollection.whereField(FieldPath.documentID(), in: ids).getDocuments(), as: Order.self)
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
