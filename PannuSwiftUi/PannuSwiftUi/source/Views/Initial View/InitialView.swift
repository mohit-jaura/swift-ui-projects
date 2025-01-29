//
//  InitialView.swift
//  Blindle
//
//  Created by Mohit Soni on 22/07/24.
//

import SwiftUI

/// The initial view of the Blindle app, providing options to log in or sign up.
/// It displays a welcome message and navigates to the login and signup views.
struct InitialView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer() // Pushes content to the bottom of the screen

                welcomeText
                actionButtons
            }
            .padding(.bottom, 30) // Padding to ensure spacing from the bottom
        }
    }
    /// A view displaying the welcome message to the user.
    ///
    /// - Returns: A `Text` view with the welcome message styled with large, bold font.
    private var welcomeText: some View {
        Text("Let's meet new people around you")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.bottom, 20)
            .lineLimit(2)
            .lineSpacing(0)
    }

    /// A view containing the login and sign up buttons.
    ///
    /// - Returns: A `VStack` with two `NavigationLink` buttons for navigating to the LoginView and SignupView.
    private var actionButtons: some View {
        VStack(alignment: .center, spacing: 20) {
            // Login button
            NavigationLink(destination: LoginView()) {
                BaseTextButton(title: "Login")
            }

            // Sign up button
            NavigationLink(destination: SignupView()) {
                BaseTextButton(title: "Sign Up")
            }
        }
    }
}

// Preview provider to render the view in the SwiftUI preview canvas.
#Preview {
    InitialView()
}
