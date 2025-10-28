//
//  OtherButtonStyle.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

struct OtherButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(Color(.label))
            .frame(height: 48)
            .scaleEffect(configuration.isPressed ?0.95 :1)
    }
}
