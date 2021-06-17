//
//  ApiRequests.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import Foundation
import Moya

enum Travel {
    case travels
}

extension Travel: TargetType {

  public var baseURL: URL {
    guard let url = URL(string: "https://tourism-api.dicoding.dev/") else {
        fatalError("Url nya gak bener")
    }
    return url
  }

  public var path: String {
    switch self {
    case .travels: return "/list"
    }
  }

  public var method: Moya.Method {
    switch self {
    case .travels: return .get
    }
  }

  public var sampleData: Data {
    return Data()
  }

  public var task: Task {
    return .requestPlain // TODO
  }

  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }

  public var validationType: ValidationType {
    return .successCodes
  }
}


