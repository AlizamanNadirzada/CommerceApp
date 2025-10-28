//
//  MainView.swift
//  AuthAppFirebase
//
//  Created by Alizaman Nadirzada on 03.05.25.
//

import Foundation
import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        
        content
    }
    
    private var content: some View {
        TabView {
            Tab("Home", systemImage: "house", content: {
                NavigationView {
                    HomeView()
                }
                .environmentObject(HomeViewModel())
            })
            
            Tab("Message", systemImage: "bubble.left.fill", content: {})
            
            Tab("Favorite", systemImage: "heart", content: {})
            
            Tab("Profile", systemImage: "person.crop.circle", content: {
                Button("Log out") {
                    Task {
                        await viewModel.signOut()
                    }
                }
            })
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
