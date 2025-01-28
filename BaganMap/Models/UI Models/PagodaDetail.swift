//
//  PagodaDetail.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation

struct PagodaDetail: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case description = "Description"
    }
    let id: String
    let description: String?
    var unwrappedDescription: String {
        description ?? "Description unavailable."
    }
}
