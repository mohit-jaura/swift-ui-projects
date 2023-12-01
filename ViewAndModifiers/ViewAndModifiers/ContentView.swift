//
//  ContentView.swift
//  ViewAndModifiers
//
//  Created by Mohit Soni on 25/05/22.
//

import SwiftUI

struct Tittle:ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

struct WaterMark:ViewModifier{
    var tittle:String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(tittle)
                .font(.caption)
                .foregroundColor(.black)
                .padding(5)
                .background(.blue)
        }
    }
}

struct GridStack<Content:View> : View{
    let rows:Int
    let columns:Int
    @ViewBuilder let content: (Int,Int) -> Content
    
    var body: some View{
        VStack{
            ForEach(0..<rows, id: \.self) {
                row in
                HStack{
                    ForEach(0..<columns, id: \.self){
                        column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
extension View{
    func tittleStyle() -> some View{
        modifier(Tittle())
    }
    
    func addWaterMark(title:String) -> some View{
        modifier(WaterMark(tittle: title))
    }
}
struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 3) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                Text("Row \(row) Col \(col)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
