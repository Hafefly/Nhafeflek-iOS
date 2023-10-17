//
//  UIApplication.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 17/10/2023.
//

import UIKit

extension UIApplication {
    static func call(phoneCode: String = "213", phone: String) {
        guard let url = URL(string: "tel://+\(phoneCode)\(phone)") else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    static func endEditing() {
        shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
