//
//  RegisterView.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import UIKit
import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        register
    }
    
    private var register: some View {
        VStack {
            Text("Create new account")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 50, weight: .semibold))
                .foregroundStyle(Color(.label))
                .padding(20)
            
            fields
            footer
            
            Spacer()
            
            titleView
        }
    }
    
    private var fields: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                BaseTextField(text: $viewModel.email, isSecure: false, placeHolder: "e-mail")
                
                BaseTextField(text: $viewModel.password, isSecure: true, placeHolder: "password")
            }
            
            Button("Sign up", action: {
                Task {
                    await viewModel.register()
                }
            })
                .buttonStyle(PrimaryButtonStyle(loading: viewModel.loading))
        }
        .padding(.horizontal, 20)
    }
    
    private var footer: some View {
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
    
    private var titleView: some View {
        HStack {
            Text("Aready have an account?")
                .foregroundStyle(.secondary)
            
            Button("Login", action: {
                Task {
                    viewModel.goToLogin()
                }
            })
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(RegisterViewModel())
}
