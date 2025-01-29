//
//  SignupView.swift
//  Blindle
//
//  Created by Mohit Soni on 22/07/24.
//

import SwiftUI

/// A view that provides a signup interface for the Blindle app.
/// It includes fields for the first name, last name, email, and password,
/// as well as options to sign up via Facebook or Google.
struct SignupView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // App title text
                    titleView

                    // First name text field
                    firstNameTextField

                    // Last name text field
                    lastNameTextField

                    // Email text field
                    emailTextField

                    // Password text field with visibility toggle
                    passwordTextField

                    // Gender selection view
                    selectGenderView

                    // Sign up button
                    signUpButton

                    // Divider with text
                    dividerWithText

                    // Social media signup buttons
                    socialMediaButtons
                }
            }
            .scrollDismissesKeyboard(.immediately) // Dismiss keyboard on scroll
            .padding(.bottom, 30) // Bottom padding to ensure spacing
        }
    }

    /// A view displaying the app title text.
    ///
    /// - Returns: A `Text` view displaying "SIGN UP WITH" in a large, bold font.
    private var titleView: some View {
        Text("SIGN UP WITH")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.vertical, 20)
    }

    /// A text field for entering the user's first name.
    ///
    /// - Returns: A `BaseTextField` view configured for first name input.
    private var firstNameTextField: some View {
        BaseTextField(
            text: $firstName,
            prompt: "First Name",
            title: "First Name",
            leftImage: "person"
        )
    }

    /// A text field for entering the user's last name.
    ///
    /// - Returns: A `BaseTextField` view configured for last name input.
    private var lastNameTextField: some View {
        BaseTextField(
            text: $lastName,
            prompt: "Last Name",
            title: "Last Name",
            leftImage: "person"
        )
    }

    /// A text field for entering the user's email address.
    ///
    /// - Returns: A `BaseTextField` view configured for email input.
    private var emailTextField: some View {
        BaseTextField(
            text: $email,
            prompt: "Email",
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

    /// A button that triggers the sign-up action.
    ///
    /// - Returns: A `BaseTextButton` view with the title "Sign Up".
    private var signUpButton: some View {
        BaseTextButton(title: "Sign Up") {
            // Add code to handle sign up with email and password
        }
    }

    /// A view containing a divider with text indicating alternative signup methods.
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

    /// A view containing social media signup buttons for Facebook and Google.
    ///
    /// - Returns: An `HStack` containing two `BaseImageTextButton` views.
    private var socialMediaButtons: some View {
        HStack(spacing: 20) {
            // Continue with Facebook button
            socialMediaButton(
                title: "Facebook",
                image: "facebook",
                action: {
                    // Add code to handle signup with Facebook
                }
            )

            // Continue with Google button
            socialMediaButton(
                title: "Google",
                image: "google",
                action: {
                    // Add code to handle signup with Google
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
    /// - Returns: A `BaseImageTextButton` view configured for social media signup.
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

    /// A view that presents the gender selection interface.
    ///
    /// This view uses `SelectGenderView` to allow the user to select their gender.
    /// The `genderSelectionHandler` closure is provided to handle the gender selection action.
    ///
    /// - Returns: A `SelectGenderView` instance configured with a handler for gender selection.
    private var selectGenderView: some View {
        SelectGenderView(genderSelectionHandler: { _ in
            // Handle gender selection
        })
    }
}

// Preview provider to render the view in the SwiftUI preview canvas.
#Preview {
    SignupView()
}
