//
//  BaseSecureField.swift
//  Blindle
//
//  Created by Mohit Soni on 17/06/24.
//

import SwiftUI

/// A custom secure field view that allows for optional left and right images,
/// as well as the ability to toggle password visibility.
///
/// - Parameters:
///   - text: A binding to the text input.
///   - prompt: The placeholder text displayed when the field is empty.
///   - title: The title for the text field.
///   - leftImage: An optional system image name displayed on the left.
///   - rightImage: An optional system image name displayed on the right.
///   - showPassword: A binding to a Boolean value that indicates whether the password is visible.
///   - rightButtonAction: An action triggered when the right button is tapped.
struct BaseSecureField: View {
    @Binding var text: String
    var prompt: String
    var title: String
    var leftImage: String?
    var rightImage: String?
    @Binding var showPassword: Bool
    var rightButtonAction: () -> Void

    var body: some View {
        HStack(alignment: .bottom) {
            // Optional left image
            if let leftImage = leftImage {
                getImageView(image: leftImage)
            }

            // Text field or secure field based on showPassword binding
            if showPassword {
                TextField(title, text: $text, prompt: Text(prompt))
            } else {
                SecureField(title, text: $text, prompt: Text(prompt))
            }

            // Optional right image with button action
            if let rightImage = rightImage {
                Button(action: rightButtonAction) {
                    getImageView(image: rightImage)
                        .foregroundStyle(.black)
                }
            }
        }
        .frame(width: 300, height: 50)
        .padding(.horizontal, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
    }

    /// Helper method to create an image view with a specified system image name.
    ///
    /// - Parameter image: The name of the system image.
    /// - Returns: A view containing the specified image.
    private func getImageView(image: String) -> some View {
        Image(systemName: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundStyle(.gray)
    }
}

#Preview {
    BaseSecureField(
        text: .constant(""),
        prompt: "",
        title: "",
        leftImage: nil,
        rightImage: nil,
        showPassword: .constant(false),
        rightButtonAction: {}
    )
}
