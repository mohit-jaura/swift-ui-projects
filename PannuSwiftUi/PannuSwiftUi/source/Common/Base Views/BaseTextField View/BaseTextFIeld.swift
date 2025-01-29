//
//  BaseOutlinedTextField.swift
//  Blindle
//
//  Created by Mohit Soni on 15/06/24.
//

import SwiftUI

/// A custom text field with an optional left image and an outlined border.
///
/// - Parameters:
///   - text: A binding to the text input.
///   - prompt: The placeholder text displayed when the field is empty.
///   - title: The title for the text field.
///   - leftImage: An optional system image name displayed on the left.
struct BaseTextField: View {
    @Binding var text: String
    var prompt: String
    var title: String
    var leftImage: String?

    var body: some View {
        HStack(alignment: .bottom) {
            // Optional left image
            if let leftImage = leftImage {
                BaseIconView(imageName: leftImage, foregroundColor: .gray, width: 20, height: 20)
            }

            // Text field with prompt and title
            TextField(title, text: $text, prompt: Text(prompt))
        }
        .frame(width: 300, height: 50)
        .padding(.horizontal, 10)
        .background(
            Color.TEXT_FIELDS,
            in: RoundedRectangle(cornerRadius: 8, style: .continuous)
        )
    }
}

#Preview {
    BaseTextField(
        text: .constant(""),
        prompt: "",
        title: "",
        leftImage: nil
    )
}
