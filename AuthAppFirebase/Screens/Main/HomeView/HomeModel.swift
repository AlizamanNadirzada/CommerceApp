//
//  Model.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 05.05.25.
//

import Foundation
import SwiftUI

struct Plant: Identifiable {
    let id = UUID()
    let image: ImageResource
    let name: String
    let price: String
    let title: String
}
