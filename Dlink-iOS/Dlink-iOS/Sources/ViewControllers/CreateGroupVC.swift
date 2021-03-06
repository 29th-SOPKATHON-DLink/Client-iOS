//
//  CreateGroupVC.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/21.
//

import UIKit

class CreateGroupVC: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleTextView: UITextView!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var participantTableView: UITableView!
    
    @IBOutlet weak var completeButton: UIButton!
    
    // MARK: - Properties
    
    private var participantList = [ParticipantDataModel]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        setTableView()
    }
    
    @IBAction func touhcUpCompleteButton(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? MainVC else {return}
        presentingVC.setDataList()
                
        NotificationCenter.default.post(name: NSNotification.Name("Dismiss"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
}

extension CreateGroupVC {
    func initUI() {
        let rootLayer = view.getGradient(startColor: .bgStartColor, endColor: .bgEndColor)
        view.layer.insertSublayer(rootLayer, at: 0)
        
        topView.layer.cornerRadius = 50
        topView.layer.masksToBounds = true
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        backView.layer.cornerRadius = 15
        backView.layer.masksToBounds = true
        
        completeButton.layer.backgroundColor = UIColor.white.cgColor
        completeButton.configuration?.contentInsets = .init(top: 15, leading: 147, bottom: 40, trailing: 147)

        
        titleTextView.delegate = self
        titleTextView.font = UIFont(name: "Pretendard-Bold", size: 25)
    }
    
    
    func setTableView() {
        participantTableView.delegate = self
        participantTableView.dataSource = self
        
        participantTableView.separatorStyle = .none
        participantTableView.backgroundColor = .navySub2
        participantTableView.layer.cornerRadius = 15
        participantTableView.layer.masksToBounds = true
        participantTableView.allowsMultipleSelection = true
        
        participantTableView.register(UINib(nibName: ParticipantTVC.identifier, bundle: nil), forCellReuseIdentifier: ParticipantTVC.identifier)
    }
}

extension CreateGroupVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension CreateGroupVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantTVC.identifier) as? ParticipantTVC else { return UITableViewCell() }
        cell.isSelected = false
        return cell
    }
}

// MARK: - UITextView Delegate

extension CreateGroupVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        titleTextView.text = ""
        titleTextView.textColor = .white
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            titleTextView.text = ""
            titleTextView.font = UIFont(name: "Pretendard-Bold", size: 25)
        } else {
            titleTextView.textColor = .white
            titleTextView.font = UIFont(name: "Pretendard-Bold", size: 25)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
}
