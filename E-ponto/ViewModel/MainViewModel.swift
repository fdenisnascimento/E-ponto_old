//
//  MainViewModel.swift
//  E-ponto
//
//  Created by Denis Nascimento on 06/06/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Firebase
import FirebaseDatabase

class MainViewModel {
    
    
    
    
    let buttonObservable: Observable<Void>
    
    
    init(input: (date: Observable<Date>, hour: Observable<Date>, registerTap: Observable<Void>)) {
        
        let dateAndHour = Observable.combineLatest(input.date, input.hour) {($0,$1)}
        
        self.buttonObservable = input.registerTap.withLatestFrom( dateAndHour ).flatMap({ ( date, hour )  in
            return MainViewModel.registerTime(date: date, hour: hour)
        })
        
    }
    
    private class func registerTime(date: Date?, hour: Date?) -> Observable<Void>  {
        
        return  Observable.create { observer in
            if let date = date, let hour = hour {
                print("date: \( date ) hour: \( hour )")
                
                let ref = getURLToSaveTime()
                
                if (ref != nil) {
                    let post = ["date" :date, "hour": hour]
                    ref?.setValue(post)
                }
                
                observer.onNext()
            } else {
                observer.onNext()
            }
            return Disposables.create()
        }
        
        
    }
    
    private class func getURLToSaveTime() -> FIRDatabaseReference? {
        
        let ref = FIRDatabase.database().reference()
        if let user = FIRAuth.auth()?.currentUser {
            return ref.child("users").child(user.uid).child(Date().dateToString())
        }
        
        return nil
    }
    
}
