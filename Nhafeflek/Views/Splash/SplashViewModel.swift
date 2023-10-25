//
//  SplashViewModel.swift
//  Nhafeflek
//
//  Created by Samy Mehdid on 13/10/2023.
//

import Foundation
import HFNavigation
import FirebaseAuth
import HFAuth
import HFCoreModel

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
                        try? FirebaseAuth.shared.loggout()
                        await NavigationCoordinator.shared.switchStartPoint(LoginView(success: self.loginSuccess))
                    }
                }
            } else {
                NavigationCoordinator.shared.switchStartPoint(LoginView(success: self.loginSuccess))
            }
        }
        
        func loginSuccess(user: User, isNew: Bool) -> Void {
            if isNew {
                do {
                    try BarberRepo.shared.createBarber(user)
                } catch {
                    #warning("show error")
                }
            }
            
            self.getMe()
        }
    }
}
