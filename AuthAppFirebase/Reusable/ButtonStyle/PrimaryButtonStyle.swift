//
//  PrimaryButtonStyle.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    private let loading: Bool
    
    init(loading: Bool = false) {
        self.loading = loading
    }
    
    func makeBody(configuration: Configuration) -> some View {
        label(configuration: configuration)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color(.blue))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .scaleEffect(configuration.isPressed && !loading ?0.95 :1)
    }
    
    @ViewBuilder
    private func label(configuration: Configuration) -> some View {
        if loading {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(Color(.systemBackground))
        } else {
            configuration.label
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color(.systemBackground))
        }
    }
}
