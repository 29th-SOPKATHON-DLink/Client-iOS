//
//  RankServiceDataModel.swift
//  Dlink-iOS
//
//  Created by Noah on 2021/11/21.
//

import Foundation

// MARK: - Welcome
struct RankServiceDataModel: Codable {
	let rank_status: Int
	let rank_success: Bool
	let rank_message: String?
	let rank_data: RankDataClass?
	
	enum CodingKeys: String, CodingKey {
		case rank_status = "status"
		case rank_success = "success"
		case rank_message = "message"
		case rank_data = "data"
	}
}

// MARK: - DataClass
struct RankDataClass: Codable {
	let rank: [Rank]
}

// MARK: - Rank
struct Rank: Codable {
	let pname: String
	let soju, beer, makgeolli, etc: Int
	let total: Int
}
