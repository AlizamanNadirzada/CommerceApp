//
//  MainViewModel.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var userEmail = ""
    
    @Published var repository = AuthRepository()
    
    init() {
        
    }
}

extension MainViewModel {
    func getCurrentUser() {
        userEmail = repository.user?.email ?? ""
    }
    
    func signOut() async {
        await repository.signOut()
        
        await Router.Login.setLoginView()
    }
}
