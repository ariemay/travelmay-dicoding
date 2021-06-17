//
//  Wisata.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import UIKit

struct Wisata {
    var id: Int
    var name: String
    var description: String
    var address: String
    var longitude: Float
    var latitude: Float
    var like: Int
    var image: String
}

extension Wisata: Decodable {
    enum WisataCodingKeys: String, CodingKey {
        case id
        case name
        case description
        case address
        case longitude
        case latitude
        case like
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WisataCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        address = try container.decode(String.self, forKey: .address)
        longitude = try container.decode(Float.self, forKey: .longitude)
        latitude = try container.decode(Float.self, forKey: .latitude)
        like = try container.decode(Int.self, forKey: .like)
        image = try container.decode(String.self, forKey: .image)
    }
}
