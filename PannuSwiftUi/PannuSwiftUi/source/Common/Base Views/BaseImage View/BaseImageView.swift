//
//  BaseImageView.swift
//  PannuSwiftUi
//
//  Created by Mohit Soni on 13/12/24.
//

import SwiftUI

struct BaseImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable(resizingMode: .stretch)
    }
}

#Preview {
    BaseImageView(imageName: "Splash")
}
