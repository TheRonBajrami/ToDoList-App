//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Ron Bajrami on 12/26/23.
//
//import FirebaseFirestoreSwift
//import SwiftUI
//
//struct ToDoListView: View {
//    @StateObject var viewModel = ToDoListViewViewModel()
//    @FirestoreQuery var items: [ToDoListItem]
//    
//            
//        init(userId: String) {
//        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
//        }


import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @ObservedObject var viewModel = ToDoListViewViewModel()
//    @FirestoreQuery var items: [ToDoListItem]
    let collectionPath: String

    init(userId: String) {
        // Trim leading and trailing whitespaces and slashes
        let cleanedUserId = userId.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .init(charactersIn: "/"))
        
        // Provide a default userId or handle the case when cleanedUserId is empty
        let defaultUserId = "defaultUser"
        guard !cleanedUserId.isEmpty else {
            // Print a warning message
            print("Warning: Invalid or empty userId provided. Using default value: \(defaultUserId)")
            // Use a default user ID
//            self._items = FirestoreQuery(collectionPath: "users/\(defaultUserId)/todos")
            collectionPath = "users/\(defaultUserId)/todos"
            viewModel.fetchUserLists(collectionPath: collectionPath)
            return
        }
        
        collectionPath = "users/\(cleanedUserId)/todos"
        
        // Print the constructed path for debugging
        print("Firestore path: \(collectionPath)")
        
//        self._items = FirestoreQuery(collectionPath: collectionPath)
        
        viewModel.fetchUserLists(collectionPath: collectionPath)
    }

    
    var body: some View {
        NavigationView{
            VStack {
                List(viewModel.items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}
#Preview {
    ToDoListView(userId: "6UWS7nbkpoccaTYzfi4iYuEGFir1")
}
