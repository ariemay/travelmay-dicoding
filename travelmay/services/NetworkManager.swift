//
//  NetworkManager.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<Travel> { get }
    func getTravelPlaces(completion: @escaping ([Wisata]) -> (), sendError: @escaping (String) -> Void)
}

struct NetworkManager: Networkable {
    
    var provider = MoyaProvider<Travel>(plugins: [NetworkLoggerPlugin()])
    
    func getTravelPlaces(completion: @escaping ([Wisata]) -> (), sendError: @escaping (String) -> Void) {
        provider.request(.travels) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(WisataResults.self, from: response.data)
                    completion(results.places)
                } catch let err {
                    sendError("Failed in decoding the data. \(err)")
                }
            case let .failure(error):
                sendError("Failed in getting the data. \(error)")
            }
        }
    }
    
    
}
