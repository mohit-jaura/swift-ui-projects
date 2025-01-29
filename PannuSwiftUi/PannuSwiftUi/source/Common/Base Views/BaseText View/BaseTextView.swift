//
//  BaseTextView.swift
//  PannuSwiftUi
//
//  Created by Mohit Soni on 14/12/24.
//

import SwiftUI

struct BaseTextView: View {
    var text: String = ""
    var textColor: Color = .black
    var fontWeight: FontWeight = .regular
    var fontSize: CGFloat = 16
    var body: some View {
        Text(text)
            .customFont(fontWeight, fontSize)
            .foregroundStyle(textColor)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    BaseTextView()
}

