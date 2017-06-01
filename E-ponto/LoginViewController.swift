//
//  LoginViewController.swift
//  E-ponto
//
//  Created by Denis Nascimento on 31/05/17.
//  Copyright (c) 2017 Denis Nascimento. All rights reserved.
//

import UIKit
import RxCocoa

class LoginViewController: BaseViewController, UITextFieldDelegate {
         
    private var login  = LoginViewModel(user: User())
    
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    @IBAction func requestPassword(_ sender: Any) {
        
    }
    
    @IBAction func enter(_ sender: Any) {
        if !login.isValid() {
            showMessage(title: nil, message: "Usuário ou senha invalídos", button: "OK")
            return
        }
        
        login.signIn { (result) in
            if !result {
                self.loginFailure()
            }else{
                self.loginSuccess()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        
        textEmail.addBottomBorderWithColor(color: UIColor.gray, width: 1.0)
        textPassword.addBottomBorderWithColor(color: UIColor.gray, width: 1.0)
        
        textEmail.addTarget(self, action: #selector(textEmailEditing), for: .editingChanged)
        textPassword.addTarget(self, action: #selector(textPasswordEditing), for: .editingChanged)
        
        if !login.email.isEmpty {
            textEmail.text = login.email
        }
    }
    
    
    func textEmailEditing() -> Void {
        login.email = self.textEmail.text!
    }
    
    func textPasswordEditing() -> Void {
        login.password = self.textPassword.text!
    }
    
    
    func loginFailure() -> Void {
        showMessage(title: nil, message: "Não foi possível logar com os dados informados!", button: "OK")
    }
    
    func loginSuccess() -> Void {
        showMessage(title: nil, message: "Login efetuado com sucesso", button: "OK")
    }
    
    
    
}
