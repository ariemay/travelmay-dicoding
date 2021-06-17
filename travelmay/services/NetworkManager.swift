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
    func getTravelPlaces(completion: @escaping ([Wisata]) -> ())
}

struct NetworkManager: Networkable {
    var provider = MoyaProvider<Travel>(plugins: [NetworkLoggerPlugin()])
    
    func getTravelPlaces(completion: @escaping ([Wisata]) -> ()) {
        provider.request(.travels) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(WisataResults.self, from: response.data)
                    completion(results.places)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
