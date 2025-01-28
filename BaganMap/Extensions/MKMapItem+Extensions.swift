//
//  MKMapItem+Extensions.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import Foundation
import MapKit

extension MKMapItem {
    convenience init(pagoda: Pagoda) {
        let coordinate = CLLocationCoordinate2D(latitude: pagoda.latitude, longitude: pagoda.longitude)
        self.init(placemark: .init(coordinate: coordinate))
    }
}
