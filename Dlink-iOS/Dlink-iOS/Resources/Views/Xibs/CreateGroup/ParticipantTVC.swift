//
//  ParticipantTVC.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/21.
//

import UIKit

class ParticipantTVC: UITableViewCell {
    static let identifier = "ParticipantTVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var labelBackView: UIView!
    @IBOutlet weak var partNameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var selectImageView: UIImageView!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            labelBackView.layer.borderColor = UIColor.navySub3.cgColor
            labelBackView.layer.borderWidth = 1
            selectImageView.image = UIImage(named: "selectActive")
        } else {
            labelBackView.layer.borderColor = UIColor.navySub2.cgColor
            selectImageView.image = UIImage(named: "selectInactive")
        }
    }
}

extension ParticipantTVC {
    func initUI() {
        contentView.backgroundColor = .navySub2
    
        labelBackView.layer.cornerRadius = 13
        labelBackView.layer.masksToBounds = true
        
        selectImageView.image = UIImage(named: "selectInActive")
    }
    
    func initCell(partName: String, userName: String) {
        partNameLabel.text = partName
        userNameLabel.text = userName
    }
}
