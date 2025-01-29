//
//  LanguageTile.swift
//  PannuSwiftUi
//
//  Created by Mohit Soni on 24/01/25.
//

import SwiftUI

struct LanguageTile: View {
    var text: String = ""
    var isSelected: Bool
    var onTap: Constants.StringCallBack?
    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .stroke(Color.blue, lineWidth: 1)
                .fill(Color.white)
                .frame(width: 24, height: 24)
                .overlay {
                    Circle()
                        .fill(isSelected ? .orange : .white)
                        .frame(width: 15, height: 15)
                }
                .padding(.leading, 15)
            BaseTextView(text: text, textColor: isSelected ? .white : .black, fontSize: 14)
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: {
            withAnimation {
                onTap?(text)
            }
        })
        .frame(width: 327, height: 46)
        .background(isSelected ? .blue : .teal)
        .cornerRadius(10)
    }
}

#Preview {
    LanguageTile(text: "English", isSelected: false, onTap: { _ in })
}
