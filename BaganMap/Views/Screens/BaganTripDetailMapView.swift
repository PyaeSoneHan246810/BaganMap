//
//  BaganTripDetailMapView.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import SwiftUI
import MapKit

struct BaganTripDetailMapView: View {
    // MARK: - ENVIRONMENT PROPERTIES
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - STATE PROPERTIES
    @State private var viewModel: ViewModel = ViewModel()
    @State private var mapCameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: .init(latitude: 21.1588948468093, longitude: 94.8712240937059),
            span: .init(latitudeDelta: 0.16, longitudeDelta: 0.16)
        )
    )
    
    // MARK: - PROPERTIES
    let trip: Trip
    
    // MARK: - INITIALIZER
    init(trip: Trip) {
        self.trip = trip
        viewModel.trip = trip
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if let error = viewModel.error {
                ErrorView(error: error)
            } else {
                tripMapView()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                dismissButton()
            }
        }
        .navigationDestination(item: $viewModel.selectedPagodaMapItem) { pagodaMapItem in
            PagodaDetailsView(
                pagodaMapItem: pagodaMapItem
            )
        }
        .onAppear {
            viewModel.getPagodasInTrip()
            viewModel.getPagodaMapItems()
        }
    }
    
    // MARK: - VIEW BUILDERS
    @ViewBuilder
    private func tripMapView() -> some View {
        Map(position: $mapCameraPosition) {
            MapPolyline(
                coordinates: viewModel.pagodasInTripCoordinates
            ).stroke(Color.primary, lineWidth: 2.0)
            ForEach(viewModel.pagodaMapItems) { pagodaMapItem in
                Annotation(
                    item: pagodaMapItem.mapItem
                ) {
                    pagodaAnnotationContentView(pagodaMapItem)
                        .onTapGesture {
                            viewModel.selectedPagodaMapItem = pagodaMapItem
                        }
                }
            }
        }
        .mapStyle(.standard)
        .mapControls {
            MapCompass()
            MapScaleView()
        }
    }
    @ViewBuilder
    private func pagodaAnnotationContentView(_ pagodaMapItem: PagodaMapItem) -> some View {
        ZStack {
            Image(.pagoda)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.accent)
                .shadow(radius: 4.0)
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 20, height: 20)
                Text("\(pagodaMapItem.number)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.black)
            }
            .position(x: 22, y: 0)
        }
    }
    @ViewBuilder
    private func dismissButton() -> some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
        .tint(.primary)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        BaganTripDetailMapView(
            trip: Trip.previewTrips[0]
        )
    }
}
