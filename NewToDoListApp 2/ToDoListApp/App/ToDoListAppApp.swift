//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Ron Bajrami on 12/25/23.
//

import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
        @StateObject var viewModel = AuthViewModel()
    
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .environmentObject(viewModel)
                
        }
    }
}
