//
//  ContentView.swift
//  Drawing
//
//  Created by Mohit Soni on 03/06/22.
//

import SwiftUI

struct Triangle:Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc:Shape{
    var startAngle:Angle
    var endAngle:Angle
    var clockWise:Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationalAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationalAdjustment
        let modifiedEnd = endAngle - rotationalAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
        
        return path
    }
}

struct Flower: Shape{
    
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8){
            
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPatel = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            let rotatedPatel = originalPatel.applying(position)
            
            path.addPath(rotatedPatel)
        }
        
        return path
    }
}

struct ColorCyclingCircle:View{
    var amount = 0.0
    var steps = 100
    
    var body: some View{
        ZStack{
            ForEach(0..<steps){
                value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [color(for: value, brightness: 1),color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom),lineWidth:2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value:Int, brightness:Double) -> Color{
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct Trapezoid: Shape{
    var insetAmount:Double
    var animatableData:Double{
        get{
            insetAmount
        }
        set{
            insetAmount = newValue
        }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        return path
    }
}
struct ContentView: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var colorCycle = 0.0
    @State private var insetAmount = 0.0
    
//    var body: some View {
//        VStack{
//            ColorCyclingCircle(amount: colorCycle)
//                .frame(width: 300, height: 300)
//            Slider(value: $colorCycle)
//                .padding(.horizontal)
//        }
//    }
    
    var body: some View{
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
