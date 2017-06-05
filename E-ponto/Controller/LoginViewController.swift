//
//  LoginViewController.swift
//  E-ponto
//
//  Created by Denis Nascimento on 31/05/17.
//  Copyright (c) 2017 Denis Nascimento. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private var viewModel: LoginViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var requestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        setupModelView()
        
        self.viewModel.requestObservable.bind { error in
            guard error != nil else { return self.requestPasswordFailure() }
            self.requestPasswordSuccess()
            }.addDisposableTo(disposeBag)
        
        self.viewModel.loginObservable.bind { user, error in
            guard user != nil else { return self.loginFailure() }
            self.goMainView()
            }.addDisposableTo(disposeBag)
        
        self.viewModel.loginEnabled.bind{ valid  in
            self.loginButton.isEnabled = valid
            self.loginButton.alpha = valid ? 1 : 0.5
            }.addDisposableTo(disposeBag)
        
        
    }
    
    private var usernameObservable: Observable<String> {
        return usernameTextField.rx.text.throttle(0.5, scheduler : MainScheduler.instance).map(){ text in
            return text ?? ""
        }
    }
    private var passwordObservable: Observable<String> {
        return passwordTextField.rx.text.throttle(0.5, scheduler : MainScheduler.instance).map(){ text in
            return text ?? ""
        }
    }
    
    private var loginButtonObservable: Observable<Void> {
        return self.loginButton.rx.tap.asObservable()
    }
    
    private var requestButtonObservable: Observable<Void> {
        return self.requestButton.rx.tap.asObservable()
    }
    
    func requestPasswordFailure() -> Void {
        AlertView.showMessage(targetVC: self, title: nil, message: "Não foi possível logar com os dados informados!")
    }
    
    func requestPasswordSuccess() -> Void {
        AlertView.showMessage(targetVC: self, title: nil, message: "Enviamos sua nova senha para seu email.")
    }
    
    func loginFailure() -> Void {
        AlertView.showMessage(targetVC: self, title: nil, message: "Não foi possível logar com os dados informados!")
    }
    
    func loginSuccess() -> Void {
        AlertView.showMessage(targetVC: self, title: nil, message: "Login efetuado com sucesso")
    }
    
    func goMainView() -> Void {
        
        let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navController") as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navController
        
        
    }
    
    // MARK: - setup
    
    func setupLayout() {
        
        usernameTextField.addBottomBorderWithColor(color: UIColor.gray, width: 1.0)
        passwordTextField.addBottomBorderWithColor(color: UIColor.gray, width: 1.0)
        usernameTextField.text = "denis@thssolution.com"
        passwordTextField.text = "123456"
    }
    
    private func setupModelView() {
        self.viewModel = LoginViewModel(input: (username: self.usernameObservable,
                                                password: self.passwordObservable,
                                                loginTap: self.loginButtonObservable,
                                                requestTap: self.requestButtonObservable
        ))
    }
    
    
}
