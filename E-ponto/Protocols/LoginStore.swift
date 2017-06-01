//
//  LoginViewModelProtocol.swift
//  E-ponto
//
//  Created by Denis Nascimento on 01/06/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import UIKit

protocol LoginStore{
  
  func signIn(email: String, password: String)  -> Bool
  func signOut()  -> Bool
  
}



