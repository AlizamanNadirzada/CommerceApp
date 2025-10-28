//
//  Router+Login.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 04.05.25.
//

import Foundation
import SwiftUI

extension Router {
    @MainActor
    enum Login {}
}

extension Router.Login {
    static var navigationController: UINavigationController? {
        Router.navigationController
    }
    
    static func setLoginView() {
        let view = LoginView()
            .environmentObject(LoginViewModel())
        
        let viewController = UIHostingController(rootView: view)
        
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
