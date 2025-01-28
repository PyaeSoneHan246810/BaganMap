//
//  BaganTripsView.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import SwiftUI

struct BaganTripsView: View {
    // MARK: - STATE PROPERTIES
    @State private var viewModel: ViewModel = ViewModel()
    
    // MARK: - BODY
    var body: some View {
        Group {
            if let error = viewModel.error {
                ErrorView(error: error)
            } else {
                tripItemsView()
            }
        }
        .navigationTitle("Bagan Trips")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getTrips()
        }
        .sheet(item: $viewModel.selectedTrip) { trip in
            NavigationStack {
                BaganTripDetailMapView(
                    trip: trip
                )
            }
        }
    }
    
    // MARK: - VIEW BUILDERS
    @ViewBuilder
    private func tripItemsView() -> some View {
        ScrollView {
            LazyVStack(spacing: 12.0) {
                ForEach(viewModel.trips) { trip in
                    TripItemView(
                        trip: trip,
                        onMapButtonTapped: {
                            viewModel.selectedTrip = trip
                        }
                    )
                }
            }
            .padding(.horizontal, 16.0)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        BaganTripsView()
    }
}
