//
//  Hero.swift
//  SuperHero
//
//  Created by Artem Kovardin on 07.06.2020.
//  Copyright © 2020 Artem Kovardin. All rights reserved.
//

import Foundation

struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let images: Images?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case images
    }
}

struct Images: Codable {
    let large: String
    
    enum CodingKeys: String, CodingKey {
        case large = "lg"
    }
}
