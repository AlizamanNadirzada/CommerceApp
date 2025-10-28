//
//  AuthRepository.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import FirebaseAuth
import SwiftUI

final class AuthRepository{
   private let auth = Auth.auth()
    
    var user: User? {
        auth.currentUser
    }
    
    var loggedIn: Bool {
        auth.currentUser != nil
    }
    
    /// Sign In
    func signIn(email: String, password: String) async {
        do {
            let _ = try await auth.signIn(withEmail: email, password: password)
        } catch {
            await Router.makeAlert(error.localizedDescription)
        }
    }
    
    /// Sign Out
    func signOut() async {
        do {
            let _ = try auth.signOut()
        } catch {
            await Router.makeAlert(error.localizedDescription)
        }
    }
    
    /// Sign up
    func signUp(email: String, password: String) async {
        do {
            let _ = try await auth.createUser(withEmail: email, password: password)
        } catch {
            await Router.makeAlert(error.localizedDescription)
        }
    }
}
