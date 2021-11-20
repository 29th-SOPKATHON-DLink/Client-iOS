//
//  AuthVC.swift
//  Dlink-iOS
//
//  Created by Noah on 2021/11/21.
//

import UIKit

class AuthVC: UIViewController {

	@IBOutlet weak var titleView: UIView?
	@IBOutlet weak var completeButton: UIButton?
	@IBOutlet weak var impressionTextView: UITextView?
	
	let placeholder = "한줄 소감을 남겨주세요!"
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		initUI()
    }
    
}

// MARK: - Keyboard 관련 extension

extension AuthVC: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		if let impressionTextView = impressionTextView {
			if impressionTextView.text == placeholder {
				impressionTextView.text = ""
			}
		}
	}


	func textViewDidEndEditing(_ textView: UITextView) {
		if let impressionTextView = impressionTextView {
			if !(impressionTextView.hasText) {
				impressionTextView.text = placeholder
			}
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	@objc
	func keyboardWillShow(_ sender: Notification) {
		if let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let keyboardHeight = keyboardRectangle.height
			self.view.frame.origin.y = -keyboardHeight
		}
	}
	
	@objc
	func keyboardWillHide(_ sender: Notification) {
		self.view.frame.origin.y = 0
	}
}

extension AuthVC {
	func initUI() {
		titleView?.clipsToBounds = true
		titleView?.layer.cornerRadius = 50.0
		titleView?.layer.maskedCorners = [.layerMaxXMaxYCorner]
		completeButton?.configuration?.contentInsets = .init(top: 1, leading: 147, bottom: 40, trailing: 147)
		completeButton?.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 18)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow(_:)),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide(_:)),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
		impressionTextView?.delegate = self
		let rootLayer = view.getGradient(startColor: .bgStartColor, endColor: .bgEndColor)
		view.layer.insertSublayer(rootLayer, at: 0)
	}
}
