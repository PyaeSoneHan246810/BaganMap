//
//  PagodaDetailView+ViewModel.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import Foundation
import Observation

extension PagodaDetailsView {
    @Observable
    class ViewModel {
        // MARK: - STATE PROPERTIES
        var pagodaMapItem: PagodaMapItem?
        private(set) var pagodaDetail: PagodaDetail?
        private(set) var error: LocalizedError?
        
        // MARK: - FUNCTIONS
        func getPagodaDetail() {
            do {
                let bagan: Bagan = try Bundle.main.decodeJsonFile("BaganMap")
                let pagodasDetails = bagan.pagodaDetails
                if let pagodaMapItem {
                    let pagodaDetail = pagodasDetails.first(where: {
                        $0.id == pagodaMapItem.id
                    })
                    self.pagodaDetail = pagodaDetail
                }
            } catch {
                if let error = error as? FileDecodingError {
                    self.error = error
                }
            }
        }
    }
}
