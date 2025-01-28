//
//  TripItemView.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import SwiftUI

struct TripItemView: View {
    // MARK: - STATE PROPERTIES
    @State private var isExpanded: Bool = false
    
    // MARK: - PROPERTIES
    let trip: Trip
    let onMapButtonTapped: () -> Void
    
    // MARK: - BODY
    var body: some View {
        GroupBox(trip.name) {
            if isExpanded {
                VStack(alignment: .leading, spacing: 16.0) {
                    Text(trip.description)
                        .font(.footnote)
                        .lineSpacing(8.0)
                    Button("See Map") {
                        onMapButtonTapped()
                    }
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 4.0)
            }
        }
        .onTapGesture {
            withAnimation(.smooth(duration: 0.5)) {
                isExpanded.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    TripItemView(
        trip: Trip.previewTrips[0],
        onMapButtonTapped: {}
    )
}
