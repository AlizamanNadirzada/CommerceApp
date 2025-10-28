//
//  RegisterViewModel.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

final class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var loading = false
    @Published var items: [ItemRegister] = []
    
    private let repository = AuthRepository()
    
    init() {
        fetchItems()
    }
        
    func fetchItems() {
        items = [
            ItemRegister(image: ._6929234GoogleLogoIcon, title: "Sign up with Google"),
            ItemRegister(image: .facebookRoundColorIcon, title: "Sign up with Facebook"),
            ItemRegister(image: .appleIcon, title: "Sign up with Apple")
        ]
    }
}

extension RegisterViewModel {
    @MainActor
    func register() async {
        loading = true
        defer {
            loading = false
        }
        
        await repository.signUp(email: email, password: password)
        
        Router.Main.setMainView()
    }
}

extension RegisterViewModel {
    @MainActor
    func goToLogin() {
        Router.Login.setLoginView()
    }
}
