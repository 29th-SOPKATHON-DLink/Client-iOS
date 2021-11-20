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
	func getGradient(startColor: UIColor, endColor: UIColor) -> CAGradientLayer {
		let gradient = CAGradientLayer()
		gradient.colors = [startColor.cgColor, endColor.cgColor]
		gradient.locations = [0.0, 1.0]
		gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
		gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
		gradient.frame = bounds
		
		return gradient
	}
}

extension UIView {
	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
		}
	}
	
	@IBInspectable var borderColor: UIColor? {
		get {
			guard let color = layer.borderColor else { return nil }
			return UIColor(cgColor: color)
		}
		set {
			guard let uiColor = newValue else { return }
			layer.borderColor = uiColor.cgColor
		}

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
