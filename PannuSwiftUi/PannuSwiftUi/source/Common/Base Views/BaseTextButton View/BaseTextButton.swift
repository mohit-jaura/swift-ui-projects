//
//  BaseTextButton.swift
//  Blindle
//
//  Created by Mohit Soni on 15/06/24.
//

import SwiftUI

/// A custom button with a text title, customizable action, and a consistent style.
///
/// - Parameters:
///   - title: The text to display on the button.
///   - action: The action to perform when the button is tapped.
struct BaseTextButton: View {
    var title: String
    var action: Constants.VoidCallBack?

    var body: some View {
        if let action = action {
            Button(title, action: action)
                .foregroundStyle(.white)
                .frame(width: 320, height: 50)
                .background(
                    Color.APP_PRIMARY,
                    in: RoundedRectangle(cornerRadius: 10, style: .continuous)
                )
        } else {
            Text(title)
                .foregroundStyle(.white)
                .frame(width: 320, height: 50)
                .background(
                    Color.APP_PRIMARY,
                    in: RoundedRectangle(cornerRadius: 10, style: .continuous)
                )
        }
    }
}

#Preview {
    BaseTextButton(title: "", action: {})
}
