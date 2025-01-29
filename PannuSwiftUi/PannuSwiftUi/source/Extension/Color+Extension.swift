//
//  Color+Extension.swift
//  Blindle
//
//  Created by Mohit Soni on 22/07/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
            let scanner = Scanner(string: hex)
            var hexNumber: UInt64 = 0
            scanner.scanLocation = hex.hasPrefix("#") ? 1 : 0
            scanner.scanHexInt64(&hexNumber)

            let r = Double((hexNumber & 0xff0000) >> 16) / 255
            let g = Double((hexNumber & 0x00ff00) >> 8) / 255
            let b = Double(hexNumber & 0x0000ff) / 255

            self.init(red: r, green: g, blue: b)
        }


}

extension Color {
    // Static property for APP_PRIMARY
static let APP_PRIMARY = Color(UIColor(red: 31/255, green: 59/255, blue: 195/255, alpha: 1))

static let TEXT_FIELDS = Color(UIColor(red: 240/255, green: 242/255, blue: 245/255, alpha: 1))

}
