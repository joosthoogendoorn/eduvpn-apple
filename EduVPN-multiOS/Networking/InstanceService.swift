//
//  InstanceService.swift
//  eduVPN
//

import Foundation
import Moya

struct DynamicInstanceService: TargetType, AcceptJson {
    
    let baseURL: URL
    
    var path: String { return "/info.json" }
    var method: Moya.Method { return .get }
    var task: Task { return .requestPlain }
    var sampleData: Data { return "".data(using: String.Encoding.utf8) ?? Data() }
}
