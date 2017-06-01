//
//  LoginStoreImp.swift
//  E-ponto
//
//  Created by Denis Nascimento on 01/06/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import UIKit
import Firebase

class LoginStoreImp: LoginStore {

  internal  func signIn(email: String, password: String) -> Bool  {
   return true
  }
  
  func signOut() -> Bool {
   return false
  }
  
}
