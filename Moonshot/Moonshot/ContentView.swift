//
//  ContentView.swift
//  Moonshot
//
//  Created by Mohit Soni on 30/05/22.
//

import SwiftUI

struct GridLayout:View{
    let astronauts:[String:Astronaut]
    let missions:[Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(missions){
                    mission in
                    NavigationLink{
                        MissionView(mission: mission, astronauts: astronauts)
                    }label: {
                        VStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:100,height: 100)
                                .padding()
                            VStack{
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth:.infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground))
                    }
                }
            }
            .padding([.horizontal,.bottom])
        }
    }
}

struct ListLayout: View{
    let astronauts:[String:Astronaut]
    let missions:[Mission]
    
    var body: some View{
        List{
            ForEach(missions){
                mission in
                NavigationLink{
                    MissionView(mission: mission, astronauts: astronauts)
                }label: {
                    HStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding([.top,.bottom])
                            .padding(.trailing,30)
                        VStack(alignment:.leading){
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.bottom,0.1)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        
    }
}

struct ContentView: View {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationView{
            Group{
                if showingGrid{
                    GridLayout(astronauts: astronauts, missions: missions)
                }else{
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark )
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Text(showingGrid ? "List View" : "Grid View")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
