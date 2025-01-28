//
//  Pagoda.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation

struct Pagoda: Decodable, Identifiable, Equatable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case mmName = "PagodaMmName"
        case engName = "PagodaEngName"
        case latitude = "Latitude"
        case longitude = "Longitude"
    }
    let id: String
    let mmName: String
    let engName: String
    let latitude: Double
    let longitude: Double
}
