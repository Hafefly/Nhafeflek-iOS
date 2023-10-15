//
//  CodeIdentifiable.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 15/10/2023.
//

import Foundation

protocol CodeIdentifiable: Codable, Identifiable {
    var id: String? { get }
}
