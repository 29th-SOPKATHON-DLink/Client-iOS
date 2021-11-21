//
//  APIConstants.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/21.
//

import Foundation

struct APIConstants {
    
    // MARK: - Base URL
	static var baseURL: URL {
		guard let url = URL(string: Bundle.main.infoDictionary?["API_URL"] as? String ?? "") else {
			fatalError("invalid url")
		}
		return url
	}
    
    // MARK: - home
    
	static let homeRankingURL = baseURL.appendingPathComponent("/home/rank")
	static let homeMeetingURL = baseURL.appendingPathComponent("/home/meeting")
	
	// MARK: - meeting
    
	static let meeting = baseURL.appendingPathComponent("/meeting")
	static let meetingUser = baseURL.appendingPathComponent("/meeting/user")
	static let meetingOpen = baseURL.appendingPathComponent("/meeting/open")
}
