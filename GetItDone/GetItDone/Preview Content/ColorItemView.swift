//
//  ColorItemView.swift
//  GetItDone
//
//  Created by Mohit Soni on 25/08/23.
//

import SwiftUI

struct ColorItemView: View {
    let backgroundColor: Color
    var body: some View {
        HStack {
            Spacer()
            Text(backgroundColor.description.capitalized).foregroundColor(.black)
            Spacer()
        }
        .padding(.vertical, 40)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

struct ColorItemView_Previews: PreviewProvider {
    static var previews: some View {
        ColorItemView(backgroundColor: .red)
    }
}
