//
//  LoginViewModel.swift
//  E-ponto
//
//  Created by Denis Nascimento on 31/05/17.
//  Copyright (c) 2017 Denis Nascimento. All rights reserved.
//

import UIKit
import Firebase
import RxSwift

class LoginViewModel {
  
  let validatedEmail: Observable<Bool>
  let validatedPassword: Observable<Bool>
  let loginEnabled: Observable<Bool>
  let loginObservable: Observable<(FIRUser?, Error?)>
  let requestObservable: Observable<Error?>
  
  init(input: (username: Observable<String>,
    password: Observable<String>,
    loginTap: Observable<Void>,
    requestTap: Observable<Void>)) {
    
    self.validatedEmail = input.username
      .map { $0.characters.count >= 5 }
      .shareReplay(1)
    
    self.validatedPassword = input.password
      .map { $0.characters.count >= 4 }
      .shareReplay(1)
    
    self.loginEnabled = Observable.combineLatest(validatedEmail, validatedPassword ) { $0 && $1 }
    let userAndPassword = Observable.combineLatest(input.username, input.password) {($0,$1)}
    
    self.loginObservable = input.loginTap.withLatestFrom(userAndPassword).flatMapLatest{ (username, password) in
      return LoginViewModel.login(username: username, password: password).observeOn(MainScheduler.instance)
    }
    
    self.requestObservable = input.requestTap.withLatestFrom(input.username).flatMap({ (username)  in
        return LoginViewModel.requestPassword(username: username)
    })
  }
    
    
    private class func requestPassword(username: String?) -> Observable<Error?> {
        
        return Observable.create { observer in
            let disposeBag = Disposables.create()
            
            guard let username = username else {
                observer.onNext(AError.General("We need your email"))
                return disposeBag
            }
            
            FIRAuth.auth()?.sendPasswordReset(withEmail: username, completion: { (error) in
                if error != nil {
                    observer.onError(error!)
                }
                observer.onNext(AError.General("ok"))
            })
            
            return disposeBag
        }
        
    }
  
  private class func login(username: String?, password: String?) -> Observable<(FIRUser?, Error?)> {
    return  Observable.create { observer in
      if let username = username, let password = password {
        FIRAuth.auth()?.signIn(withEmail: username, password: password) { user, error in
          observer.onNext((user, error))
        }
      } else {
        // TODO: - add error
        observer.onNext((nil, AError.General("ok")))
      }
      return Disposables.create()
    }
  }
}


