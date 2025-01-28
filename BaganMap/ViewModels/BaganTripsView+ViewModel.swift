//
//  BaganTripsView+ViewModel.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import Foundation
import Observation

extension BaganTripsView {
    @Observable
    class ViewModel {
        // MARK: - STATE PROPERTIES
        var selectedTrip: Trip?
        private(set) var trips: [Trip] = []
        private(set) var error: LocalizedError?

        // MARK: - FUNCTIONS
        func getTrips() {
            do {
                let bagan: Bagan = try Bundle.main.decodeJsonFile("BaganMap")
                trips = bagan.trips
            } catch {
                if let error = error as? FileDecodingError {
                    self.error = error
                }
            }
        }
    }
}
