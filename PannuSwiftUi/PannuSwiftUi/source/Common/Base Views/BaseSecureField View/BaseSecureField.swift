//
//  BaseSecureField.swift
//  Blindle
//
//  Created by Mohit Soni on 17/06/24.
//

import SwiftUI

/// A custom secure field view that allows for optional left and right images,
/// as well as the ability to toggle password visibility.
struct BaseSecureField: View {
    // Binding to the text input from the parent view.
    @Binding var text: String

    // State variable to control the visibility of the password.
    @State private var showPassword: Bool = false

    // Default title and prompt for the text field.
    private let title: String = "Password"
    private let prompt: String = "Password"

    // Width and height for the images.
    private let imageSize: CGFloat = 20

    var body: some View {
        HStack(alignment: .bottom) {
            // Left image view with gray color.
            BaseIconView(imageName: "key", foregroundColor: .gray, width: imageSize, height: imageSize)

            // Conditional rendering of either a TextField or a SecureField based on the showPassword state.
            if showPassword {
                TextField(title, text: $text, prompt: Text(prompt))
            } else {
                SecureField(title, text: $text, prompt: Text(prompt))
            }

            // Button to toggle password visibility.
            Button(action: {
                showPassword.toggle()
            }) {
                BaseIconView(imageName: showPassword ? "eye" : "eye.slash", foregroundColor: .black, width: imageSize, height: imageSize)
            }
        }
        .frame(width: 300, height: 50) // Fixed frame size for the field.
        .padding(.horizontal, 10) // Horizontal padding around the field.
        .background(
            // Background color and rounded rectangle shape for the text field.
            Color.TEXT_FIELDS,
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
    }
}

// Preview provider to render the view in the SwiftUI preview canvas.
#Preview {
    BaseSecureField(
        text: .constant("") // Constant empty text binding for preview purposes.
    )
}

