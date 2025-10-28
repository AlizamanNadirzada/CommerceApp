//
//  HomeViewModel.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 05.05.25.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var plants: [Plant] = [
        Plant(image: .unknown4, name: "Aliquam lobortis", price: "$22", title: "Discounted price"),
        Plant(image: .elevateYourCreativeProjectsWithTheEnchanting, name: "Auctor sem ", price: "$19", title: "Discounted price"),
        Plant(image: .theCutestAdditionToYourPlantCollectionThe, name: "Viverra sollicitudin", price: "$19", title: "Discounted price")
    ]
}
