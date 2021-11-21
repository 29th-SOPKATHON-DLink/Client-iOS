//
//  GetGroupService.swift
//  Dlink-iOS
//
//  Created by Noah on 2021/11/21.
//

import Foundation
import Alamofire

struct GetGroupService {
	
	static let shared = GetGroupService()
	
	/// 선택한 그룹 보여주기
	
	func getSelectedGroup(userId: Int, completion: @escaping (NetworkResult<Any>) -> (Void)) {
		let url = APIConstants.meeting + "\(userId)"
		
		let header: HTTPHeaders = [
			"Content-Type": "application/json"
		]
		
		let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
		dataRequest.responseData { response in
			switch response.result {
			case .success:
				guard let statusCode = response.response?.statusCode else { return }
				guard let value = response.value else { return }
				let networkResult = self.judgeStatus(by: statusCode, value)
				completion(networkResult)
			case .failure(let error):
				print(error)
				completion(.networkFail)
			}
		}
	}
	private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
		switch statusCode {
		case 200: return isValidData(data: data)
		case 400: return .pathErr
		case 500: return .serverErr
		default: return .networkFail
		}
	}
	
	private func isValidData(data: Data) -> NetworkResult<Any> {
		let decoder = JSONDecoder()
		guard let decodedData = try? decoder.decode(GetGroupDataModel.self, from: data) else { return .pathErr }
		return .success(decodedData)
	}	
}
