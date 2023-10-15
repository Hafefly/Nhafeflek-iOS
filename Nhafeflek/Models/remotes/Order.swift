//
//  Order.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 15/10/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct OrderReference: CodeIdentifiable {
    @DocumentID var id: String?
    var userId: String
    var barberId: String
    var createdAt: String
    var deletedAt: String
}

struct Order: CodeIdentifiable {
    var id: String?
    var userId: String
    var barberId: String
    let fade: UInt?
    let beard: UInt?
    let hairdryer: UInt?
    let razor: UInt?
    let scissors: UInt?
    let straightener: UInt?
    let atHome: UInt?
    
    var totalPrice: UInt
    
    var intervals: [OrderInterval]?
    var confirmedInterval: OrderInterval?
    
    static let mockOrders = [
        Order(id: "1", userId: "", barberId: "", fade: 150, beard: 100, hairdryer: nil, razor: nil, scissors: 50, straightener: nil, atHome: 150, totalPrice: 450, confirmedInterval: OrderInterval(from: Timestamp(), to: Timestamp())),
        Order(id: "2", userId: "", barberId: "", fade: 150, beard: 100, hairdryer: nil, razor: nil, scissors: 50, straightener: nil, atHome: 150, totalPrice: 450, confirmedInterval: OrderInterval(from: Timestamp(), to: Timestamp())),
        Order(id: "3", userId: "", barberId: "", fade: 150, beard: 100, hairdryer: nil, razor: nil, scissors: 50, straightener: nil, atHome: 150, totalPrice: 450, confirmedInterval: OrderInterval(from: Timestamp(), to: Timestamp())),
        Order(id: "4", userId: "", barberId: "", fade: 150, beard: 100, hairdryer: nil, razor: nil, scissors: 50, straightener: nil, atHome: 150, totalPrice: 450, confirmedInterval: OrderInterval(from: Timestamp(), to: Timestamp()))
    ]
}

struct OrderInterval: Codable {
    var from: Timestamp
    var to: Timestamp
    
    var timeString: String {
        return "\(from.dateValue().getFormattedHour()) - \(to.dateValue().getFormattedDate())"
    }
}
