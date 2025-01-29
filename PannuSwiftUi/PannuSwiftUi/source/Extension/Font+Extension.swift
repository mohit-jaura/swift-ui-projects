//
//  Color+Extension.swift
//  Blindle
//
//  Created by Mohit Soni on 22/07/24.
//

import Foundation
import SwiftUI

enum FontWeight {
    case light
    case regular
    case medium
    case semiBold
    case bold
    case black
}

extension Font {
    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
            switch fontType {
            case .light:
                Font.custom("Poppins-Regular", size: size)
            case .regular:
                Font.custom("Poppins-Regular", size: size)
            case .medium:
                Font.custom("Poppins-Medium", size: size)
            case .semiBold:
                Font.custom("Poppins-Bold", size: size)
            case .bold:
                Font.custom("Poppins-Bold", size: size)
            case .black:
                Font.custom("Poppins-Regular", size: size)
            }
        }
}

extension Text {
    func customFont(_ fontWeight: FontWeight? = .regular, _ size: CGFloat? = nil) -> Text {
        return self.font(.customFont(fontWeight ?? .regular, size ?? 16))
    }
}
