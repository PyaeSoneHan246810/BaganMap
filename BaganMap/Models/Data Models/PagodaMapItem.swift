//
//  PagodaMapItem.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation
import MapKit

struct PagodaMapItem: Identifiable, Hashable, Equatable {
    let id: String
    let number: Int
    let mmName: String
    let engName: String
    let mapItem: MKMapItem
}
