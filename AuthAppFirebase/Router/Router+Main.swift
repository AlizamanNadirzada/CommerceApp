//
//  Router+Main.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import UIKit
import SwiftUI

extension Router {
    @MainActor
    enum Main {}
}

extension Router.Main {
    static var navigationController: UINavigationController? {
        Router.navigationController
    }
    
    static func setMainView() {
        let view = MainView()
            .environmentObject(MainViewModel())
        
        let viewController = UIHostingController(rootView: view)
        
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
