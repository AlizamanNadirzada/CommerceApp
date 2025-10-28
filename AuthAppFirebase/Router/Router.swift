//
//  Router.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import UIKit
import SwiftUI

@MainActor
enum Router {
    static var window: UIWindow?
    static var navigationController: UINavigationController?
    
    static func initial(windowScene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: windowScene)
        let repository = AuthRepository()
        
        @ViewBuilder
        var rootView: some View {
            if repository.loggedIn {
                MainView()
                    .environmentObject(MainViewModel())
            } else {
                LoginView()
                    .environmentObject(LoginViewModel())
            }
        }
        
        let viewController = UIHostingController(rootView: rootView)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isHidden = true
        
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
        self.navigationController = navigationController
        
        
        return window
    }
    
    static func makeAlert(_ message: String) {
        let alert = UIAlertController(title: "Ooops...😔", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        navigationController?.present(alert, animated: true)
    }
    
    static func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
}
