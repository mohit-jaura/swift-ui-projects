//
//  DividerLineView.swift
//  Blindle
//
//  Created by Mohit Soni on 22/07/24.
//

import SwiftUI

/// A reusable view for divider lines.
struct DividerLineView: View {
    var body: some View {
        Rectangle()
            .frame(width: 80, height: 1)
            .foregroundColor(.black)
    }
}

#Preview {
    DividerLineView()
}
