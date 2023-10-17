//
//  SplashViewModel.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import Foundation
import HFNavigation
import FirebaseAuth

extension SplashView {
    class Model: ObservableObject {
        
        init() {
            self.getMe()
        }
        
        func getMe(){
            if let barberId = FirebaseAuth.shared.getUserId() {
                Task {
                    do {
                        let barber = try await BarberRepo.shared.getBarber(barberId)
                        if barber.verified {
                            NavigationCoordinator.shared.switchStartPoint(MainView())
                        } else {
                            if nil != barber.barbershopUID {
                                NavigationCoordinator.pushScreen(ActivationView(barber: barber))
                            } else {
                                NavigationCoordinator.pushScreen(AdmissionView())
                            }
                        }
                    } catch {
                        #warning("implement error banner")
                        debugPrint(error.localizedDescription)
                    }
                }
            } else {
                NavigationCoordinator.shared.switchStartPoint(LoginView())
            }
        }
        
    }
}
