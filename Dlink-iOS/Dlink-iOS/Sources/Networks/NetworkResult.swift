//
//  NetworkResult.swift
//  Dlink-iOS
//
//  Created by soyeon on 2021/11/21.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
