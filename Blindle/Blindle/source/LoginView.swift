//
//  LoginView.swift
//  Blindle
//
//  Created by Mohit Soni on 15/06/24.
//

import Foundation
import SwiftUI

/// The login view of the Blindle app, which provides fields for email and password, and options to log in via Facebook or Google.
struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Title text
            Text("Let's meet new people around you")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)

            // Email text field
            BaseOutlinedTextField(
                text: $email,
                prompt: "Enter your Email",
                title: "Email",
                leftImage: "envelope"
            )

            // Password text field with visibility toggle
            BaseSecureField(
                text: $password,
                prompt: "Enter your password",
                title: "Password",
                leftImage: "key",
                rightImage: showPassword ? "eye" : "eye.slash",
                showPassword: $showPassword,
                rightButtonAction: {
                    // Action to toggle password visibility
                    showPassword.toggle()
                }
            )

            // Login button
            BaseTextButton(title: "Login") {
                // Code to log in to the application with email and password
            }

            // Continue with Facebook button
            BaseImageTextButton(
                title: "Continue with Facebook",
                image: ImageResource(name: "facebook", bundle: .main),
                backgroundColor: .white,
                foregroundColor: .black,
                showOutLined: true
            ) {
                // Code to log in to the application with Facebook
            }

            // Continue with Google button
            BaseImageTextButton(
                title: "Continue with Google",
                image: ImageResource(name: "google", bundle: .main),
                backgroundColor: .white,
                foregroundColor: .black,
                showOutLined: true
            ) {
                // Code to log in to the application with Google
            }

            Spacer()

            // Sign up prompt text
            Text("If you don't have an account?")
                .padding(.top, 8)

            // Sign up button
            BaseTextButton(title: "Sign Up") {
                // Code to sign up for a new account
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
