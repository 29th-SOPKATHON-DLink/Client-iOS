//
//  GetGroupDataModel.swift
//  Dlink-iOS
//
//  Created by Noah on 2021/11/21.
//

import Foundation

// MARK: - Welcome
struct GetGroupDataModel: Codable {
	let status: Int
	let success: Bool
	let message: String?
	let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
	let title: Title
	let users: [User]
}

// MARK: - Title
struct Title: Codable {
	let title: String
}

// MARK: - User
struct User: Codable {
	let uname: String
}
