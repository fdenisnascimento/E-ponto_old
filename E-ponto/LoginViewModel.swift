//
//  LoginViewModel.swift
//  E-ponto
//
//  Created by Denis Nascimento on 31/05/17.
//  Copyright (c) 2017 Denis Nascimento. All rights reserved.
//

import UIKit
import Firebase

class LoginViewModel {
    
    var email: String = ""
    var password: String = ""
    
    private var  user: User
    
    init(user: User) {
        self.user = user
        self.email = user.email
        self.password = user.password
        
    }
    
    func isValid() -> Bool {
        if self.email.isEmpty || self.password.isEmpty {
            return false
        }
        return true
    }
    
    func signIn(completion: @escaping (_ result: Bool)->())  {
        
        FIRAuth.auth()?.signIn(withEmail: self.email, password: self.password, completion: { (user, error) in
            if error != nil {
                print("error login with email: \(self.email) password: \(self.password) | error: \(String(describing: error?.localizedDescription))")
                completion(false)
            }
            completion(true)
        })
        
    }
    
}
