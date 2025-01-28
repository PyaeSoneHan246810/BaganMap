//
//  PagodaDetailsView.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import SwiftUI

struct PagodaDetailsView: View {
    // MARK: - ENVIRONMENT PROPERTIES
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - STATE PROPERTIES
    @State private var viewModel: ViewModel = ViewModel()
    
    // MARK: - PROPERTIES
    let pagodaMapItem: PagodaMapItem
    
    // MARK: - INITIAlIZER
    init(pagodaMapItem: PagodaMapItem) {
        self.pagodaMapItem = pagodaMapItem
        viewModel.pagodaMapItem = pagodaMapItem
    }
    
    // MARK: - BODY
    var body: some View {
        Group {
            if let error = viewModel.error {
                ErrorView(error: error)
            } else {
                pagodaDetailsView()
            }
        }
        .navigationTitle(pagodaMapItem.mmName)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Close") {
                    dismiss()
                }
            }
        }
        .onAppear {
            viewModel.getPagodaDetail()
        }
    }
    
    // MARK: - VIEW BUILDERS
    @ViewBuilder
    private func pagodaDetailsView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 12.0) {
                Text(pagodaMapItem.engName)
                    .font(.title2)
                if let pagodaDetail = viewModel.pagodaDetail {
                    Text(pagodaDetail.unwrappedDescription)
                        .lineSpacing(8.0)
                }
            }
            .padding(.horizontal, 20.0)
            .padding(.vertical, 12.0)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigationStack {
        PagodaDetailsView(
            pagodaMapItem: PagodaMapItem.preview!
        )
    }
}
