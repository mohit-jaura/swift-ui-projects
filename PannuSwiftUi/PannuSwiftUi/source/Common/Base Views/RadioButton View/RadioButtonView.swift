//
//  RadioButtonView.swift
//  Blindle
//
//  Created by Mohit Soni on 23/07/24.
//

import SwiftUI

struct RadioButtonView: View {
    @Binding var isSelected: Bool
    var label: String
    var size: CGFloat = 20
    private let selectedColor: Color = .APP_PRIMARY
    private let unselectedColor: Color = .gray
    var labelColor: Color = .black
    var tag: Int
    var tapHandler: Constants.IntCallBack?
    var body: some View {
        HStack {
            Circle()
                .fill(isSelected ? selectedColor : Color.clear) // Inner circle color
                .padding(3)
                .overlay(
                    Circle()
                        .stroke(isSelected ? selectedColor : Color.gray, lineWidth: 1)
                ) // Circle outline
                .frame(width: 20, height: 20)

            if (!label.isEmpty) {
                Text(label)
                    .foregroundColor(labelColor)
            }
        }
        .contentShape(Rectangle()) // Ensures the entire HStack is tappable
        .onTapGesture {
            withAnimation() {
                isSelected = true
            }
            if let tapHandler = tapHandler {
                tapHandler(tag)
            }
        }
    }
}

#Preview {
    RadioButtonView(isSelected: .constant(true), label: "Male", tag: 0, tapHandler: { _ in })
}
