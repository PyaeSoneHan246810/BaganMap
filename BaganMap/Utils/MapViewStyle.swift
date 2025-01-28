//
//  MapViewStyle.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation

enum MapViewStyle: String, CaseIterable, Identifiable {
    case standard = "standard"
    case hybrid = "hybrid"
    case imagery = "imagery"
    var id: String {
        self.rawValue
    }
    var label: String {
        switch self {
        case .standard:
            return "Standard"
        case .hybrid:
            return "Hybrid"
        case .imagery:
            return "Imagery"
        }
    }
}
