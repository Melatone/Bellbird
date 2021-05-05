//
//  ActiveView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/30/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct ActiveView: View {
    @Binding var alarms : [Alarm]
    
    
    var body: some View {
        NavigationView{
            ZStack{
                
                
                
                Color.init("Backdrop")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView{
                VStack{
                    ForEach(0..<self.alarms.count, id: \.self){ buzz in
                        Group{
                            Spacer()
                            if self.alarms[buzz].active == true{
                                
                                if type(of:self.alarms[buzz]) == Repeater.self{
                                    
                                    RepeaterView(alarm: Binding.constant(self.alarms[buzz]as! Repeater))
                                    
                                }
                                else  if type(of: self.alarms[buzz]) == GroupAlarm.self {
                                    
                                    GroupAlarmView(groupAlarm: Binding.constant(self.alarms[buzz]as! GroupAlarm))
                                    
                                }
                                else {
                                    
                                    TimebombView(bomb:  Binding.constant(self.alarms[buzz]as! Timebomb))
                                }
                                
                            }
                          Spacer()
                        }
                        
                    }
                

                    NavigationLink(destination: AddAlarmView(alarms: $alarms), label: {
                        Image(systemName: "plus")
                            .font(.custom("Helvetic Neue",size:30))
                       
                    })
                
                .foregroundColor(Color("BackAccent"))
            }.navigationBarTitle("Active Alarms")
                }
        }
        
    }
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(alarms: Binding.constant([Repeater(name: "Name", date: DateComponents(hour:7,minute:30), interval: 5, hue: Color("BBLime"), meridian: "AM", active: true)]))
    }
}

