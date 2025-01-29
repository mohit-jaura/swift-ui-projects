//
//  BaseImageTextButton.swift
//  Blindle
//
//  Created by Mohit Soni on 15/06/24.
//

import SwiftUI

/// A custom button that displays an image and a text title, with customizable
/// background and foreground colors, and an optional outline.
///
/// - Parameters:
///   - title: The text to display in the button.
///   - image: The image resource to display in the button.
///   - backgroundColor: The background color of the button.
///   - foregroundColor: The color of the text and image in the button.
///   - showOutLined: A Boolean value that indicates whether the button has an outline.
///   - action: The action to perform when the button is tapped.
struct BaseImageTextButton: View {
    var title: String
    var image: String
    var backgroundColor: Color
    var foregroundColor: Color
    var showOutLined: Bool = false
    var action: Constants.VoidCallBack

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(ImageResource(name: image, bundle: .main))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                Text(title)
            }
        }
        .foregroundStyle(foregroundColor)
        .frame(width: 150, height: 50)
        .background(
            Color(backgroundColor),
            in: RoundedRectangle(cornerRadius: 10, style: .continuous)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(showOutLined ? Color.APP_PRIMARY : backgroundColor, lineWidth: 1)
        )
    }
}

#Preview {
    BaseImageTextButton(
        title: "",
        image: "",
        backgroundColor: .black,
        foregroundColor: .white,
        showOutLined: false,
        action: {}
    )
}
