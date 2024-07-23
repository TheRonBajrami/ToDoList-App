//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Ron Bajrami on 12/26/23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var items: [ToDoListItem] = []

    init() {}
    
    func delete(id: String) {
        
    }
    
    func fetchUserLists(collectionPath: String) {
        items.removeAll()
        Firestore.firestore().collection(collectionPath).getDocuments { documentSnapshot, error in
            if let error = error {
                print("Error to get user lists", error)
                return
            }
            documentSnapshot?.documents.forEach({ snapshot in
                let item = try! snapshot.data(as: ToDoListItem.self)
                self.items.append(item)
            })
            print(self.items)
        }
    }
}
