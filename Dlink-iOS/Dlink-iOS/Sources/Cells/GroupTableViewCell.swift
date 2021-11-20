//
//  GroupTableViewCell.swift
//  Dlink-iOS
//
//  Created by EUNJU on 2021/11/21.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(homeData: GroupContentData) {
        titleLabel.text = homeData.groupName
        subTitleLabel.text = homeData.groupMember
        checkButton.setImage(homeData.makeImage(), for: .normal)
        bgImage.image = homeData.makeBackGroundImage()
    }
    
}
