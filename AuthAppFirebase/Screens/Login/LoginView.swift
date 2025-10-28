//
//  LoginView.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var viewModel: LoginViewModel
    
    var body: some View {
        content
    }
    
    private var content: some View {
        VStack {
            Text("Login to your account")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 50, weight: .semibold))
                .foregroundStyle(Color(.label))
                .padding(20)
            
            field
            otherLoginOptions
            
            Spacer()
            
            createAccountButton
        }
    }
    
    private var field: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                BaseTextField(text: $viewModel.email, isSecure: false, placeHolder: "e-mail")
                
                BaseTextField(text: $viewModel.password, isSecure: true, placeHolder: "password")
            }
            
            Button("Forgot password?", action: {})
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button("Sign in", action: {
                Task {
                    await viewModel.signIn()
                }
            })
            .buttonStyle(PrimaryButtonStyle(loading: viewModel.loading))
        }
        .padding(.horizontal, 20)
    }
    
    private var otherLoginOptions: some View {
        VStack(spacing: 20) {
            ForEach(viewModel.items, id: \.image) { element in
                HStack {
                    Image(element.image)
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    Button(element.title, action: {})
                        .buttonStyle(OtherButtonStyle())
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 4)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 50)
    }
    
    private var createAccountButton: some View {
        HStack {
            Text("Don't have an account?")
                .foregroundStyle(.secondary)
            
            Button("Create an account", action: {
                Task {
                    viewModel.goToRegister()
                }
            })
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
