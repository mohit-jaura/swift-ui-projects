//
//  ScrollViewLayout.swift
//  GetItDone
//
//  Created by Mohit Soni on 25/08/23.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    let destinationItem: Color
    @Binding var colors: [Color]
    @Binding var draggedItem: Color?

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }

    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }

    func dropEntered(info: DropInfo) {
        // Swap Items
        if let draggedItem {
            let fromIndex = colors.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = colors.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.colors.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? (toIndex + 1) : toIndex)
                    }
                }
            }
        }
    }
}

struct ScrollViewLayout: View {
    @State private var showAddTodoView: Bool = false
    @State private var draggedColor: Color?
    @State private var scrollPosition: CGPoint = .zero
    @State private var colors: [Color] = [.purple, .blue, .cyan, .green, .yellow, .orange, .red, .gray, .black, .accentColor, .indigo]

    var body: some View {
//        NavigationView {
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        Spacer()
                            .frame(height: 40)

                        ForEach(colors, id: \.self) { color in
                            ColorItemView(backgroundColor: color)
                                .onDrag {
                                    self.draggedColor = color
                                    return NSItemProvider()
                                }
                                .onDrop(of: [.text],
                                        delegate: DropViewDelegate(destinationItem: color, colors: $colors, draggedItem: $draggedColor))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
                .gesture(
                    DragGesture().onChanged { value in
                        if value.translation.height < 30 {
                            showAddTodoView = true
                        }
                    }
                )
                .ignoresSafeArea()
                .background(Color.brown)
            }.navigationDestination(isPresented: $showAddTodoView) {
                AddTodoView()
            }
//        }

    }
}

struct ScrollViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewLayout()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        print("value in reduce", value)
    }
}
