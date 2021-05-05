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
                
                ForEach(0..<self.alarms.count, id: \.self){ buzz in
                    Group{
                        
                        if self.alarms[buzz].active {
                            
                            if self.alarms[buzz].type == "Repeater"{
                                
                                RepeaterView(alarm: Binding.constant(self.alarms[buzz]as! Repeater))
                            
                            }
                            else  if self.alarms[buzz].type == "Group"{
                                
                                GroupAlarmView(groupAlarm: Binding.constant(self.alarms[buzz]as! GroupAlarm))
                                
                            }
                            else {
                                
                                TimebombView(bomb: self.$alarms[buzz])
                            }
                            
                        }
                    }
                    
                }
                
             
                
                
                
                
                VStack{
                    
                    
                    
                    
                    
                    
                    
                    NavigationLink(destination: AddAlarmView(alarms: $alarms), label: {
                        Image(systemName: "plus")
                            .font(.custom("Helvetic Neue",size:30))
                        
                    })
                }
                .foregroundColor(Color("BackAccent"))
            }.navigationBarTitle("Active Alarms")
            
        }
        
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView(alarms: Binding.constant([Repeater(interval: 5)]))
    }
}

