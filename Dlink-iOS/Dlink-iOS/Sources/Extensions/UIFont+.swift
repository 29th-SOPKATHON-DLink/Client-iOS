//
//  UIFont+.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/20.
//

import UIKit

extension UIFont {
    class func Pretendard(type: PretendardType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.name, size: size) else { return UIFont.init() }
        
        return font
    }

    enum PretendardType: String {
        case black = "Black"
        case bold = "Bold"
        case extraBold = "ExtraBold"
        case extraLight = "ExtraLight"
        case light = "Light"
        case medium = "Medium"
        case regular = "Regular"
        case semiBold = "SemiBold"
        case thin = "Thin"
        
        var name: String {
            return "Pretendard-" + self.rawValue
        }
    }
}
