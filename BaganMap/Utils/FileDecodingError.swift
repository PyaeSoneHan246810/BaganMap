//
//  FileDecodingError.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation

enum FileDecodingError: LocalizedError {
    case fileNotFound
    case invalidData
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File to decode was not found.."
        case .invalidData:
            return "Data was invalid."
        case .decodingFailed:
            return "Failed to decode data."
        }
    }
}
