//
//  Trip.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation

struct Trip: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "TravelRouteId"
        case name = "TravelRouteName"
        case description = "TravelRouteDescription"
        case pagodaList = "PagodaList"
    }
    let id: String
    let name: String
    let description: String
    let pagodaList: [String]
}
