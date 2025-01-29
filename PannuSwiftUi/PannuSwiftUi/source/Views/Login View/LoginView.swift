//
//  LoginView.swift
//  Blindle
//
//  Created by Mohit Soni on 15/06/24.
//

import SwiftUI

/// A view that allows users to log in to the Blindle app.
/// It includes fields for entering an email and password,
/// and provides options to log in via Facebook or Google.
struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Spacer() // Pushes the content to the bottom of the screen

                VStack(alignment: .center, spacing: 20) {
                    // App title text
                    titleView

                    // Email text field
                    emailTextField

                    // Password text field with visibility toggle
                    passwordTextField

                    // Login button
                    loginButton

                    // Divider with text
                    dividerWithText

                    // Social media login buttons
                    socialMediaButtons
                }
            }
            .padding(.bottom, 30) // Bottom padding to ensure spacing
        }
    }

    /// A view displaying the app title text.
    ///
    /// - Returns: A `Text` view displaying "LOGIN WITH" in a large, bold font.
    private var titleView: some View {
        Text("LOGIN WITH")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.vertical, 20)
    }

    /// A text field for entering the user's email address.
    ///
    /// - Returns: A `BaseTextField` view configured for email input.
    private var emailTextField: some View {
        BaseTextField(
            text: $email,
            prompt: "Enter your Email",
            title: "Email",
            leftImage: "envelope"
        )
    }

    /// A secure field for entering the user's password with a visibility toggle.
    ///
    /// - Returns: A `BaseSecureField` view configured for password input.
    private var passwordTextField: some View {
        BaseSecureField(
            text: $password
        )
    }

    /// A button that triggers the login action with email and password.
    ///
    /// - Returns: A `BaseTextButton` view with the title "Login".
    private var loginButton: some View {
        BaseTextButton(title: "Login") {
            // Add code to handle login with email and password
        }
    }

    /// A view containing a divider with text indicating alternative login methods.
    ///
    /// - Returns: An `HStack` containing `DividerLineView` and a text label.
    private var dividerWithText: some View {
        HStack(alignment: .center, spacing: 10) {
            DividerLineView()
            Text("or continue with")
                .padding(.horizontal, 5)
            DividerLineView()
        }
    }

    /// A view containing social media login buttons for Facebook and Google.
    ///
    /// - Returns: An `HStack` containing two `BaseImageTextButton` views.
    private var socialMediaButtons: some View {
        HStack(spacing: 20) {
            // Continue with Facebook button
            socialMediaButton(
                title: "Facebook",
                image: "facebook",
                action: {
                    // Add code to handle login with Facebook
                }
            )

            // Continue with Google button
            socialMediaButton(
                title: "Google",
                image: "google",
                action: {
                    // Add code to handle login with Google
                }
            )
        }
    }

    /// Creates a social media button with the given title and image.
    ///
    /// - Parameters:
    ///   - title: The title text to display on the button.
    ///   - image: The name of the image to display on the button.
    ///   - action: The action to perform when the button is tapped.
    /// - Returns: A `BaseImageTextButton` view configured for social media login.
    private func socialMediaButton(title: String, image: String, action: @escaping () -> Void) -> some View {
        BaseImageTextButton(
            title: title,
            image: image,
            backgroundColor: .white,
            foregroundColor: .black,
            showOutLined: true,
            action: action
        )
    }
}

// Preview provider to render the view in the SwiftUI preview canvas.
#Preview {
    LoginView()
}
