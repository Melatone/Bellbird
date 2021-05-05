//
//  GroupAlarmView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 3/24/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI



struct GroupAlarmView: View {
    var index = 0
    @Binding var groupAlarm: GroupAlarm
    @State var expand = false

    var body: some View{
        
        VStack{
            
            ZStack{
                
                Text("\(self.groupAlarm.name)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top)
                    .frame(alignment:.trailing)
                Toggle(isOn:self.$groupAlarm.active){
                    Text("")
                    
                } .padding( .trailing, 260.0)
                
                
                
                
                
                
                
                Image(systemName: expand ? "chevron.up": "chevron.down")
                    .foregroundColor(.white)
                    
                    .padding(.leading, 250)
                    .onTapGesture {
                        self.expand.toggle()
                        
                        
                        
                        
                }
                
            }
            ScrollView{
                if expand{
                    ForEach(0...groupAlarm.times.count-1, id: \.self){
                        time in
                        Toggle(isOn: self.$groupAlarm.times[time].active){
                            Text("\(self.groupAlarm.times[time].date.value(for:.hour)!):\(self.groupAlarm.times[time].date.value(for:.minute)!)")
                                .foregroundColor(.white)
                                .font(.title)
                                .bold()
                                .frame(alignment:.center)
                            
                            
                        }.padding(.leading)
                            
                            .toggleStyle(NewToggleStyle())
                        
                        
                        
                    }
                    
                }
            }
            
            
            
            
            if !expand{
                Text("\(self.groupAlarm.times[0].date.value(for:.hour)!):\(self.groupAlarm.times[0].date.value(for:.minute)!)\(self.groupAlarm.times[0].meridian)")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 40)
                
                
                
            }
            
            
            
            
            
        }.frame(width: 320, height: expand ? 420: 120, alignment: .top)
            .background(self.groupAlarm.hue)
            .cornerRadius(20)
            .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 10))
        
        
        
        
    }
}


struct NewToggleStyle:ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.label
            Button(action: {
                configuration.isOn.toggle()
            }){  Image(systemName: configuration.isOn ? "square.fill": "square")
            }.foregroundColor(.white)
                .font(.headline)
                .animation(.easeIn)
            
        }
    }
}

struct GroupAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        GroupAlarmView(groupAlarm: Binding.constant(GroupAlarm(name: "name", times: [ComplexDate(date: DateComponents(hour:7,minute:30), active: false, meridian: "AM")], hue : Color("BBGreen"))))
    }
}
