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
	
	@IBOutlet weak var sojuCountLabel: UILabel!
	@IBOutlet weak var beerCountLabel: UILabel!
	@IBOutlet weak var makCountLabel: UILabel!
	@IBOutlet weak var etcCountLabel: UILabel!
	@IBOutlet weak var totalCountLabel: UILabel!
	
	let placeholder = "한줄 소감을 남겨주세요!"
	
	var sojuCount = 0 {
		didSet {
			totalCountLabel.text = "\(sojuCount + beerCount + makCount + etcCount)"
		}
	}
	var beerCount = 0 {
		didSet {
			totalCountLabel.text = "\(sojuCount + beerCount + makCount + etcCount)"
		}
	}
	var makCount = 0 {
		didSet {
			totalCountLabel.text = "\(sojuCount + beerCount + makCount + etcCount)"
		}
	}
	var etcCount = 0 {
		didSet {
			totalCountLabel.text = "\(sojuCount + beerCount + makCount + etcCount)"
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		initUI()
	}
	
	@IBAction func sojuPlusButton(_ sender: Any) {
		sojuCount += 1
		sojuCountLabel.text = "\(sojuCount)"
	}
	
	@IBAction func sojuMinusButton(_ sender: Any) {
		if sojuCount > 0 {
			sojuCount -= 1
			sojuCountLabel.text = "\(sojuCount)"
		}
		return
	}
	
	@IBAction func beerPlusButton(_ sender: Any) {
		beerCount += 1
		beerCountLabel.text = "\(beerCount)"
	}
	
	@IBAction func beerMinusButton(_ sender: Any) {
		if beerCount > 0 {
			beerCount -= 1
			beerCountLabel.text = "\(beerCount)"
		}
		return
	}
	
	@IBAction func makPlusButton(_ sender: Any) {
		makCount += 1
		makCountLabel.text = "\(makCount)"
	}
	
	@IBAction func makMinusButton(_ sender: Any) {
		if makCount > 0 {
			makCount -= 1
			makCountLabel.text = "\(makCount)"
		}
		return
	}
	@IBAction func etcPlusButton(_ sender: Any) {
		etcCount += 1
		etcCountLabel.text = "\(etcCount)"
	}
	
	@IBAction func etcMinusButton(_ sender: Any) {
		if etcCount > 0 {
			etcCount -= 1
			etcCountLabel.text = "\(etcCount)"
		}
		return
	}
    
    @IBAction func touchUpComplte(_ sender: Any) {
        self.dismiss(animated: true, completion: nil
        )
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
