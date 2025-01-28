//
//  BaganPagodasMapView.swift
//  BaganMap
//
//  Created by Dylan on 27/01/2025.
//

import SwiftUI
import MapKit
import Contacts

struct BaganPagodasMapView: View {
    // MARK: - STATE PROPERTIES
    @State private var viewModel: ViewModel = ViewModel()
    @State private var mapCameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: .init(latitude: 21.1588948468093, longitude: 94.8712240937059),
            span: .init(latitudeDelta: 0.18, longitudeDelta: 0.18)
        )
    )

    // MARK: - BODY
    var body: some View {
        Group {
            if let error = viewModel.error {
                ErrorView(error: error)
            } else {
                pagodasMapView()
            }
        }
        .navigationTitle("Bagan Map")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                mapViewStylePickerMenuView()
            }
            ToolbarItem(placement: .topBarTrailing) {
                markerStylePickerMenuView()
            }
        }
        .sheet(item: $viewModel.selectedPagodaMapItem) { pagodaMapItem in
            NavigationStack {
                PagodaDetailsView(
                    pagodaMapItem: pagodaMapItem
                )
            }
        }
        .onAppear {
            viewModel.getPagodaMapItems()
        }
    }
    
    // MARK: - VIEW BUILDERS
    @ViewBuilder
    private func pagodasMapView() -> some View {
        Map(position: $mapCameraPosition) {
            ForEach(viewModel.pagodaMapItems) { pagodaMapItem in
                Annotation(
                    item: pagodaMapItem.mapItem
                ) {
                    pagodaAnnotationContentView(pagodaMapItem)
                }
            }
        }
        .mapStyle(viewModel.mapStyle)
        .mapControls {
            MapCompass()
            MapScaleView()
        }
    }
    @ViewBuilder
    private func pagodaAnnotationContentView( _ pagodaMapItem: PagodaMapItem) -> some View {
        ZStack {
            switch viewModel.selectedMarkerStyle {
            case .temple:
                Image(.pagoda)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.accent)
                    .shadow(radius: 4.0)
            case .pin:
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.accent)
                    .shadow(radius: 4.0)
            }
        }
        .onTapGesture {
            viewModel.selectedPagodaMapItem = pagodaMapItem
        }
    }
    @ViewBuilder
    private func markerStylePickerMenuView() -> some View {
        Menu("Marker Style", systemImage: "mappin.square.fill") {
            Picker("Marker Style Picker", selection: $viewModel.selectedMarkerStyle) {
                ForEach(MarkerStyle.allCases) { style in
                    Text(style.label)
                        .tag(style)
                }
            }
        }
    }
    @ViewBuilder
    private func mapViewStylePickerMenuView() -> some View {
        Menu("Map View Style", systemImage: "map.fill") {
            Picker("Map View Style Picker", selection: $viewModel.selectedMapViewStyle) {
                ForEach(MapViewStyle.allCases) { style in
                    Text(style.label)
                        .tag(style)
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        BaganPagodasMapView()
    }
}
