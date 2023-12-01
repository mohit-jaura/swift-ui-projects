//
//  ContentView.swift
//  BetterRest
//
//  Created by Mohit Soni on 25/05/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUpTime = defaultWakeUpTime
    @State private var coffeeAmount = 1
    @State private var alertTittle = ""
    @State private var alertMessagee = ""
    @State private var showAlert = false
    
    static var defaultWakeUpTime:Date{
        var component = DateComponents()
        component.hour = 7
        component.minute = 0
        return Calendar.current.date(from: component) ?? Date.now
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    VStack(alignment: .leading, spacing: 5) {
                        TittleHeading(heading: "When do you want to wake up?")
                        DatePicker("Please select a Date", selection: $wakeUpTime,displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        TittleHeading(heading: "Desired amount of sleep")
                        Stepper("\(sleepAmount.formatted()) Hours",value: $sleepAmount,in: 4...12,step: 0.25)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        TittleHeading(heading: "Daily coffe intake")
                        Picker(selection: $coffeeAmount) {
                            ForEach(2...20,id: \.self){
                                cup in
                               Text("\(cup)")
                            }
                        } label: {
                            Text(coffeeAmount == 1 ? "1 cup" :"\(coffeeAmount) cups")
                        }
                    }
                }
                Section{
                    HStack{
                        padding()
                        Button("Calculate",action: calculateBedTime)
                            .foregroundColor(.black)
                            .font(.title2)
                        padding()
                    }
                    .background(.clear)
                }
                .background(.clear)
            }
            .navigationTitle("Better Rest")
            .navigationBarTitleDisplayMode(.large)
            .alert(alertTittle, isPresented: $showAlert) {
                Button("OK") {}
            }message: {
                Text(alertMessagee )
            }
        }
    }
    
    func calculateBedTime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let wakeUp = convertTimeToSeconds()
            let prediction = try model.prediction(wake: wakeUp, estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUpTime - prediction.actualSleep
            alertTittle = "Your ideal bedtime is..."
            alertMessagee = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch{
            alertTittle = "Error"
            alertMessagee = "Sorry, there was a problem calculating your bedtime."
        }
        showAlert = true
    }
    
    func convertTimeToSeconds() -> Double{
        let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUpTime)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        return Double(hour + minute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TittleHeading:View{
    var heading:String
    var body: some View{
        Text(heading)
            .font(.headline)
    }
}
