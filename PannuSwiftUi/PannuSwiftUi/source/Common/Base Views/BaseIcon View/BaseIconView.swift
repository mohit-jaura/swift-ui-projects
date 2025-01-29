//
//  BaseIconView.swift
//  Blindle
//
//  Created by Mohit Soni on 26/06/24.
//

import SwiftUI

struct BaseIconView: View {
    var imageName: String
    var foregroundColor: Color
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .foregroundColor(foregroundColor)
    }
}

#Preview {
    BaseIconView(imageName: "", foregroundColor: .black, width: 0, height: 0)
}
