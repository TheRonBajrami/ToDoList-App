//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Ron Bajrami on 12/25/23.


import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabView {
                    ToDoListView(userId: viewModel.currentUser?.id ?? "")
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                }
            } else {
                LoginView()
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: AuthViewModel())
    }
}


//import SwiftUI
//
//struct ContentView: View {
//    @EnvironmentObject var viewModel: AuthViewModel
//    
//    var body: some View {
//        Group {
//            if viewModel.userSession != nil {
//                TabView {
//                    ToDoListView()
//                        .tabItem {
//                            Label("Home", systemImage: "house")
//                        }
//                    
//                    ProfileView()
//                        .tabItem {
//                            Label("Profile", systemImage: "person.circle")
//                        }
//                }
//            } else {
//                LoginView()
//            }
//            
//        }
//    }
//}
//#Preview {
//    ContentView()
//}

