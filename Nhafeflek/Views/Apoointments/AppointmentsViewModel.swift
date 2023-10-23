//
//  AppointmentsViewModel.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 22/10/2023.
//

import Foundation
import HFCoreUI
import HFCoreModel
import HFAuth

extension AppointmentsView {
    class Model: ObservableObject {
        
        @Published public private(set) var appointmentsUiState: UiState<[Order]> = .idle
        
        func addListenerForOrders() {
            self.appointmentsUiState = .loading
            guard let barberID = FirebaseAuth.shared.getUserId() else {
                return
            }
            
            BarberRepo.shared.addListenerForOrdersReferences(barberID) { ids in
                OrderRepo.shared.addListenerForOrders(withIds: ids) { appointments in
                    self.appointmentsUiState = .success(appointments)
                }
            }
            
        }
    }
}
