//
//  Router+Register.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 04.05.25.
//

import Foundation
import SwiftUI

extension Router {
    @MainActor
    enum Register {}
}

extension Router.Register {
    static var navigationController: UINavigationController? {
        Router.navigationController
    }
    
    static func setRegisterView() {
        let view = RegisterView()
            .environmentObject(RegisterViewModel())
        
        let viewController = UIHostingController(rootView: view)
        
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
