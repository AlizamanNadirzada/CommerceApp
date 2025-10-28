//
//  DetailView.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 05.05.25.
//

import Foundation
import SwiftUI

struct DetailView: View {
    let plant: Plant
    
    var body: some View {
        ScrollView {
            VStack {
//                titleView
                screen
                details
            }
        }
    }
    
    private var titleView: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .resizable()
                .frame(width: 30, height: 20)
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private var screen: some View {
        VStack(spacing: 40) {
            Text(plant.name)
                .font(.system(size: 35, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(plant.image)
                .resizable()
                .frame(width: 300, height: 350)
        }
        .padding()
    }
    
    private var details: some View {
        VStack(spacing: 20) {
            Text("Description")
                .font(.system(size: 30, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
//            Spacer()
            
            Text("Categories: Potter Plants, Small Plants")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Tag: Flower, Cafe Plant, Cactus")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(plant.title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text(plant.price)
                    .font(.system(size: 28, weight: .semibold))
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(plant: Plant(image: .unknown4, name: "Viverra sollicitudin", price: "$19", title: "Discounted price"))
}
