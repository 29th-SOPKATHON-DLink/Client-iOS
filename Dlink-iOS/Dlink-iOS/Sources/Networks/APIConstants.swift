//
//  APIConstants.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/21.
//

import Foundation

struct APIConstants {
    
    // MARK: - Base URL
    
    static let baseURL = ""
    
    // MARK: - /user
    
    static let homeRankingURL = baseURL + "/home/rank"
    static let homeMeetingURL = baseURL + "/home/meeting"
    
    static let meeting = baseURL + "/meeting"
    static let meetingUser = baseURL + "/meeting/user"
    static let meetingOpen = baseURL + "/meeting/open"
}
