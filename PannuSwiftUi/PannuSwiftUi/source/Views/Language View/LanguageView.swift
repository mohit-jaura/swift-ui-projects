//
//  LanguageView.swift
//  PannuSwiftUi
//
//  Created by Mohit Soni on 24/01/25.
//

import SwiftUI

struct LanguageView: View {
    @State private var selectedLanguage: String = "English"
    var body: some View {
        VStack(alignment: .leading) {
            LogoHeader()
            BaseTextView(text: "Select your preferred Language", fontWeight: .bold, fontSize: 24)
            LanguageTile(text: "English", isSelected: selectedLanguage == "English") { language in
                selectedLanguage = language
            }
            LanguageTile(text: "Hindi", isSelected: selectedLanguage == "Hindi") { language in
                selectedLanguage = language
            }
            LanguageTile(text: "Punjabi", isSelected: selectedLanguage == "Punjabi") { language in
                selectedLanguage = language
            }
        }
        Spacer()
        VStack(alignment: .center) {
            BaseTextButton(title: "Continue")
        }
        Spacer()
    }
}

#Preview {
    LanguageView()
}
