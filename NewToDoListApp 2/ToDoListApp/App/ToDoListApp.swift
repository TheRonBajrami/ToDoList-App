//
//  ToDoListApp.swift
//  ToDoListApp
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
