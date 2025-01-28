//
//  ErrorView.swift
//  BaganMap
//
//  Created by Dylan on 28/01/2025.
//

import SwiftUI

struct ErrorView: View {
    // MARK: - PROPERTIES
    let error: LocalizedError
    // MARK: - BODY
    var body: some View {
        ContentUnavailableView(
            "Error has occurred!",
            systemImage: "exclamationmark.triangle.fill",
            description: Text(error.localizedDescription)
        )
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    ErrorView(
        error: FileDecodingError.decodingFailed
    )
}
