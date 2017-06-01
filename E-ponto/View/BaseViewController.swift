//
//  BaseViewController.swift
//  E-ponto
//
//  Created by Denis Nascimento on 31/05/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showMessage(title: String!, message: String!, button: String!) -> Void {
        
        var title = title
        if title == nil{
            title = "E-ponto"
        }
        
        var button = button
        if button == nil{
            button = "OK"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: button, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
