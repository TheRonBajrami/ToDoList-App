//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Ron Bajrami on 1/7/24.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var pasword = ""
    
    init() {}
    
    func Auth;.auth().createUser(withEmail: email, withPassword: password) {result, error in
        guard let userId = result?.user.uid else {
            
        }
        
    }
    
}
    
    
