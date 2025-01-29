import SwiftUI

/// A view representing the splash screen for the application.
/// It displays a logo and a background image for a specified duration before transitioning to the initial view.
struct SplashView: View {
    /// A state variable to manage the visibility of the splash screen.
    @State private var isPresented: Bool = true

    /// The duration (in seconds) for how long the splash screen is displayed.
    private let splashDuration: TimeInterval = 3.0

    /// The duration (in seconds) of the animation used during the transition to the next view.
    private let animationDuration: TimeInterval = 1.0

    var body: some View {
        ZStack {
            if isPresented {
                splashContent
            } else {
                LanguageView()
            }
        }
        .ignoresSafeArea() // Ensures the content fills the entire screen
        .onAppear(perform: startSplashTimer) // Starts the splash screen timer when the view appears
    }

    /// The content of the splash screen, which includes a background image, a semi-transparent overlay, and a logo header.
    private var splashContent: some View {
        ZStack {
            BaseImageView(imageName: AppImages.splashBackground)
            Rectangle()
                .fill(Color.white.opacity(0.85)) // Semi-transparent white overlay
            LogoHeader(isLarge: true)
        }
    }

    /// Starts a timer to transition from the splash screen to the initial view.
    ///
    /// After the specified `splashDuration`, the splash screen will fade out with an animation.
    private func startSplashTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration) {
            withAnimation(.easeOut(duration: animationDuration)) {
                self.isPresented = false // Transition to the initial view
            }
        }
    }
}

#Preview {
    SplashView()
}
