//
//  Trip+Extensions.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import Foundation

extension Trip {
    static var previewTrips: [Trip] {
        guard let bagan: Bagan = try? Bundle.main.decodeJsonFile("BaganMap") else {
            return []
        }
        return bagan.trips
    }
}
