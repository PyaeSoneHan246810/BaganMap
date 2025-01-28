//
//  Bagan.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation

struct Bagan: Decodable {
    enum CodingKeys: String, CodingKey {
        case pagodas = "Tbl_BaganMapInfoData"
        case pagodaDetails = "Tbl_BaganMapInfoDetailData"
        case trips = "Tbl_TravelRouteListData"
    }
    let pagodas: [Pagoda]
    let pagodaDetails: [PagodaDetail]
    let trips: [Trip]
}
