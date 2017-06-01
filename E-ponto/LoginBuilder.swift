//
//  LoginBuilder.swift
//  E-ponto
//
//  Created by Denis Nascimento on 31/05/17.
//  Copyright (c) 2017 Denis Nascimento. All rights reserved.
//

import UIKit

struct LoginBuilder {
    
    static func viewController() -> UIViewController {
        let viewModel = LoginViewModel()
        let router = LoginRouter()
        let viewController = LoginViewController(withViewModel: viewModel, router: router)
        router.viewController = viewController
        
        return viewController
    }
}
