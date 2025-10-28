//
//  BaseTextField.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

struct BaseTextField: View {
    @Binding var text: String
    
    var isSecure = false
    let placeHolder: String
    
    var body: some View {
        VStack {
            if !text.isEmpty {
                Text(placeHolder)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 16, weight: .regular))
                    .allowsHitTesting(false)
            }
            
            if isSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .overlay(alignment: .leading) {
            if text.isEmpty {
                Text(placeHolder)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 16, weight: .regular))
                    .allowsHitTesting(false)
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 68)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray6), lineWidth: 1.5)
        }
        .padding(1.5)
        .animation(.snappy, value: text)
    }
}

fileprivate struct BaseTextFieldDemo: View {
    @State private var text = ""
    
    var body: some View {
        BaseTextField(text: $text, placeHolder: "email")
    }
}

#Preview {
    BaseTextFieldDemo()
}
