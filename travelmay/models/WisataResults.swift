//
//  WisataResults.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import Foundation
import UIKit

struct WisataResults {
    let count: Int
    let places: [Wisata]
}

extension WisataResults: Decodable {
    private enum ResultsCodingKey: String, CodingKey {
        case count
        case places
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultsCodingKey.self)
        
        count = try container.decode(Int.self, forKey: .count)
        places = try container.decode([Wisata].self, forKey: .places)
    }
}
