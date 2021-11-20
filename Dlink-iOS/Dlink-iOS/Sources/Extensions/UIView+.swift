//
//  UIView+.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/20.
//

import UIKit

extension UIViewController {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}

extension UIView {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}

extension UIView {
	func setGradient(startColor: UIColor, endColor: UIColor) {
		let gradient = CAGradientLayer()
		gradient.colors = [startColor.cgColor, endColor.cgColor]
		gradient.locations = [0.0, 1.0]
		gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
		gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
		gradient.frame = bounds
		layer.addSublayer(gradient)
	}
}
