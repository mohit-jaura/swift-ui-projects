//
//  SelectGenderView.swift
//  Blindle
//
//  Created by Mohit Soni on 23/07/24.
//

import SwiftUI

/// A view for selecting gender with two radio buttons for male and female options.
/// It updates the selection state and triggers a callback on selection change.
///
/// - Parameters:
///   - genderSelectionHandler: A callback function to handle the selected gender tag.
struct SelectGenderView: View {
    @State private var isMaleSelected: Bool = false
    @State private var isFemaleSelected: Bool = false

    var genderSelectionHandler: Constants.IntCallBack

    var body: some View {
        // Horizontal stack to arrange gender selection options.
        HStack(spacing: 15) {
            Text("Gender:")
            // RadioButton for male gender.
            RadioButtonView(
                isSelected: $isMaleSelected,
                label: "Male",
                tag: AppEnums.GenderType.male.rawValue,
                tapHandler: handleGenderSelection
            )
            // RadioButton for female gender.
            RadioButtonView(
                isSelected: $isFemaleSelected,
                label: "Female",
                tag: AppEnums.GenderType.female.rawValue,
                tapHandler: handleGenderSelection
            )
        }
    }

    /// Handles gender selection when a RadioButton is tapped.
    /// Updates the selection state and triggers the callback.
    ///
    /// - Parameter tag: The tag associated with the selected RadioButton.
    private func handleGenderSelection(tag: Int) {
        let genderType = getSelectedGenderType(selectedTag: tag)
        isMaleSelected = genderType == .male
        isFemaleSelected = genderType == .female
        genderSelectionHandler(tag) // Invoke the callback to notify about the gender selection.
    }

    /// Determines the selected gender type based on the provided tag.
    ///
    /// - Parameter selectedTag: The tag value of the selected RadioButton.
    /// - Returns: The corresponding GenderType enumeration value.
    private func getSelectedGenderType(selectedTag: Int) -> AppEnums.GenderType {
        return AppEnums.GenderType(rawValue: selectedTag) ?? .male
    }
}

// Preview provider to render the view in the SwiftUI preview canvas.
#Preview {
    SelectGenderView(genderSelectionHandler: { _ in })
}
