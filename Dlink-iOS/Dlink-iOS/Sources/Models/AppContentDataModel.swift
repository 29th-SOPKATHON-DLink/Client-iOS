//
//  AppContentDataModel.swift
//  Dlink-iOS
//
//  Created by EUNJU on 2021/11/21.
//

import UIKit

struct GroupContentData {
    let groupName: String
    let groupMember: String
    let profileImageName: String
    let backgroundImageName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
    
    func makeBackGroundImage() -> UIImage? {
        return UIImage(named: backgroundImageName)
    }
}
