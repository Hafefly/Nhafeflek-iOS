//
//  HFUser.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 16/10/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct HFUser: CodeIdentifiable {
    @DocumentID var id: String?
    
    var firstname: String
    var lastname: String
    var profileImage: String?
    var phone: String?
    var email: String?
    var instagram: String?
    var province: String
    var haircutsDone: UInt
    var age: UInt
    var vip: Bool
}
