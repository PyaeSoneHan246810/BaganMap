//
//  TabsView.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import SwiftUI

struct TabsView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        TabView {
            Tab("မြေပုံ", systemImage: "map.fill") {
                NavigationStack {
                    BaganPagodasMapView()
                }
            }
            Tab("ခရီးစဉ်များ", systemImage: "figure.walk") {
                NavigationStack {
                    BaganTripsView()
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    TabsView()
}
