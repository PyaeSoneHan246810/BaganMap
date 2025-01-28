//
//  PagodaMapItem+Extension.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import Foundation

extension PagodaMapItem {
    static var preview: PagodaMapItem? {
        guard let bagan: Bagan = try? Bundle.main.decodeJsonFile("BaganMap") else {
            return nil
        }
        let pagoda = bagan.pagodas[4]
        let pagodaMapItem = PagodaMapItem (
            id: pagoda.id,
            number: 1,
            mmName: pagoda.mmName,
            engName: pagoda.engName,
            mapItem: .init(pagoda: pagoda)
        )
        return pagodaMapItem
    }
}
