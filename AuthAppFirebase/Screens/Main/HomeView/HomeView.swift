//
//  HomeView.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 05.05.25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    content
                    titleScreen
                    area
                }
            }
        }
    }
    
    private var content: some View {
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
    
    private var titleScreen: some View {
        VStack(spacing: 14) {
            Text("Spring House Plants")
                .font(.system(size: 35, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("The perfect Choice!")
                .font(.system(size: 35, weight: .regular))
                .foregroundStyle(.secondary.opacity(1.5))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
    }
    
    private var area: some View {
        LazyVGrid(columns: [
            .init(.flexible(minimum: 0, maximum: .infinity), spacing: 20),
            .init(.flexible(minimum: 0, maximum: .infinity), spacing: 20)
        ], spacing: 25) {
            ForEach(viewModel.plants, id: \.id) { element in
                NavigationLink(destination: DetailView(plant: element)) {
                    VStack {
                        Image(element.image)
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        Text(element.name)
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(Color.black)
                            .padding(5)
                        
                        HStack {
                            Text(element.title)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color.secondary)
                            Spacer()
                            
                            Text(element.price)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(Color.black)
                        }
                        .padding(.horizontal, 5)
                    }                    .padding(.horizontal, 5)
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}
