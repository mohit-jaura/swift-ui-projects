//
//  ListViewLayout.swift
//  GetItDone
//
//  Created by Mohit Soni on 25/08/23.
//

import SwiftUI

struct ListViewLayout: View {
    @State private var colors: [Color] = [.purple, .blue, .cyan, .green, .yellow, .orange, .red, .gray, .black, .orange, .accentColor, .cyan, .indigo]
    private func onMove(source: IndexSet, destination: Int) {
        colors.move(fromOffsets: source, toOffset: destination)

    }
    var body: some View {
        List {
            ForEach(colors, id: \.self) { color in
                ColorItemView(backgroundColor: color)
            }
            .onMove(perform: onMove)
            .padding(.horizontal, 20)
        }
        .gesture(
            DragGesture().onChanged { value in
                if value.translation.height > 0 {
                    print("Scroll down")
                } else {
                    print("Scroll up")
                }
            }
        )
    }
}

struct ListViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListViewLayout()
    }
}
