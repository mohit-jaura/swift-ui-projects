//
//  MissionView.swift
//  Moonshot
//
//  Created by Mohit Soni on 01/06/22.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember{
        let role:String
        let astronaut:Astronaut
    }
    
    let crew:[CrewMember]
    
    init(mission:Mission,astronauts:[String:Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else{
                fatalError("Missing \(member.name)")
            }
        }
    }
    var mission:Mission
    var body: some View {
        GeometryReader{
            geometry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:geometry.size.width * 0.6)
                        .padding([.top,.bottom])
                    Text(mission.formattedLaunchDate)
                        .font(.headline.bold())
                    VStack(alignment:.leading){
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        
                        Text(mission.description)
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom,5)
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(crew,id: \.role){ crewMember in
                                NavigationLink{
                                    AstronautView(astronaut: crewMember.astronaut)
                                }label: {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 100, height: 75)
                                        .clipShape(Circle())
                                        .overlay(Circle().strokeBorder(.white,lineWidth: 1))
                                    VStack(alignment:.leading){
                                        Text(crewMember.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding([.horizontal,.top])
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    static let astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
