//
//  BaganTripDetailMapView+ViewModel.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import Foundation
import MapKit
import Observation

extension BaganTripDetailMapView {
    @Observable
    class ViewModel {
        // MARK: - STATE PROPERTIES
        var trip: Trip?
        var selectedPagodaMapItem: PagodaMapItem?
        private(set) var pagodasInTrip: [Pagoda] = []
        private(set) var pagodasInTripCoordinates: [CLLocationCoordinate2D] = []
        private(set) var pagodaMapItems: [PagodaMapItem] = []
        private(set) var error: LocalizedError?
        
        // MARK: - FUNCTIONS
        func getPagodasInTrip() {
            do {
                let bagan: Bagan = try Bundle.main.decodeJsonFile("BaganMap")
                let allPagodas = bagan.pagodas
                if let trip {
                    let pagodaInTrips: [Pagoda] = trip.pagodaList.compactMap { pagodaId in
                        allPagodas.first(where: { $0.id == pagodaId})
                    }
                    self.pagodasInTrip = pagodaInTrips
                    pagodaInTrips.forEach { pagoda in
                        let coordinate: CLLocationCoordinate2D = .init(latitude: pagoda.latitude, longitude: pagoda.longitude)
                        self.pagodasInTripCoordinates.append(coordinate)
                    }
                }
            } catch {
                if let error = error as? FileDecodingError {
                    self.error = error
                }
            }
        }
        
        func getPagodaMapItems() {
            pagodasInTrip.forEach { pagoda in
                let mapItem: MKMapItem = .init(pagoda: pagoda)
                mapItem.name = pagoda.mmName
                mapItem.pointOfInterestCategory = .landmark
                let pagodaNumber = pagodasInTrip.firstIndex(of: pagoda)! + 1
                let pagodaMapItem = PagodaMapItem(
                    id: pagoda.id,
                    number: pagodaNumber,
                    mmName: pagoda.mmName,
                    engName: pagoda.engName,
                    mapItem: mapItem
                )
                pagodaMapItems.append(pagodaMapItem)
            }
        }
    }
}
