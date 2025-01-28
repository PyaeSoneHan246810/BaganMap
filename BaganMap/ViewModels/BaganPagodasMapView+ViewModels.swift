//
//  BaganPagodasMapView+ViewModels.swift.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation
import SwiftUI
import MapKit
import Observation

extension BaganPagodasMapView {
    @Observable
    class ViewModel {
        // MARK: - STATE PROPERTIES
        var selectedPagodaMapItem: PagodaMapItem?
        var selectedMapViewStyle: MapViewStyle = .standard
        var selectedMarkerStyle: MarkerStyle = .temple
        private(set) var pagodaMapItems: [PagodaMapItem] = []
        private(set) var error: LocalizedError?
        
        // MARK: - COMPUTED PROPERTIES
        var mapStyle: MapStyle {
            switch selectedMapViewStyle {
            case .standard: .standard
            case .hybrid: .hybrid
            case .imagery: .imagery
            }
        }
        
        // MARK: - FUNCTIONS
        func getPagodaMapItems() {
            do {
                let bagan: Bagan = try Bundle.main.decodeJsonFile("BaganMap")
                let pagodas = bagan.pagodas
                pagodas.forEach { pagoda in
                    let mapItem: MKMapItem = .init(pagoda: pagoda)
                    mapItem.name = pagoda.mmName
                    mapItem.pointOfInterestCategory = .landmark
                    let pagodaNumber = pagodas.firstIndex(of: pagoda)! + 1
                    let pagodaMapItem = PagodaMapItem(
                        id: pagoda.id,
                        number: pagodaNumber,
                        mmName: pagoda.mmName,
                        engName: pagoda.engName,
                        mapItem: mapItem
                    )
                    pagodaMapItems.append(pagodaMapItem)
                }
            } catch {
                if let error = error as? FileDecodingError {
                    self.error = error
                }
            }
        }
    }
}
