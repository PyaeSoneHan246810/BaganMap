//
//  MarkerStyle.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation

enum MarkerStyle: String, CaseIterable, Identifiable {
    case temple = "temple"
    case pin = "pin"
    var id: String {
        self.rawValue
    }
    var label: String {
        switch self {
        case .temple:
            return "Temple"
        case .pin:
            return "Pin"
        }
    }
}
