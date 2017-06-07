//
//  Extensions.swift
//  E-ponto
//
//  Created by Denis Nascimento on 31/05/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import UIKit

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0,y: 0, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width,y: 0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
}

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyymmdd"
        return dateFormatter.string(from: self)
    }
    
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}


