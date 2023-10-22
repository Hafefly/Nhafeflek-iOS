//
//  Appointements.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import SwiftUI
import HFCoreUI
import HFCoreModel

struct AppointmentsView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(Order.mockOrders, id: \.id?.hashValue) { order in
                HaircutCard(order: order)
            }
            .padding(.vertical, 16)
        }
    }
}


struct AppiontmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsView()
    }
}
