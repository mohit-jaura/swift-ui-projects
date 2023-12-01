//
//  EmojiRatingView.swift
//  BookWorm
//
//  Created by Mohit Soni on 21/11/23.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int

    var body: some View {
        switch rating {
            case 1:
                Text("1")
            case 2:
                Text("2")
            case 3:
                Text("3")
            case 4:
                Text("4")
            default:
                Text("5")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
