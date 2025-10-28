//
//  LoginViewModel.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var loading = false
    @Published var items: [Item] = []
    
    private let repository = AuthRepository()
    
    init() {
        fetchItems()
    }
        
    func fetchItems() {
        items = [
            Item(image: ._6929234GoogleLogoIcon, title: "Continue with Google"),
            Item(image: .facebookRoundColorIcon, title: "Continue with Facebook"),
            Item(image: .appleIcon, title: "Continue with Apple")
        ]
    }
}

extension LoginViewModel {
    @MainActor
    func signIn() async {
        loading = true
        defer {
            loading = false
        }
        
        await repository.signIn(email: email, password: password)
        
        Router.Main.setMainView()
    }
}

extension LoginViewModel {
    @MainActor
    func goToRegister() {
        Router.Register.setRegisterView()
    }
}
