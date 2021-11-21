//
//  ParticipantDataModel.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/21.
//

import Foundation

// MARK: - Welcome
struct ParticipantDataModel: Codable {
	let parti_status: Int
	let parti_success: Bool
	let parti_message: String?
	let parti_data: PartDataClass?
	
	enum CodingKeys: String, CodingKey {
		case parti_data = "data"
		case parti_status = "status"
		case parti_message = "message"
		case parti_success = "success"
	}
}

// MARK: - DataClass
struct PartDataClass: Codable {
	let title: PartiTitle
	let users: [PartiUser]?
}

// MARK: - Title
struct PartiTitle: Codable {
	let title: String
}

// MARK: - User
struct PartiUser: Codable {
	let uname: String
}

