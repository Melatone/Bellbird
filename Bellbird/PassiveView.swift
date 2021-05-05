//
//  PassiveView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 3/24/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct PassiveView: View {
    @Binding var alarms : [Alarm]
    var body: some View {
        NavigationView{
            ZStack{
                
                
                
                Color.init("Backdrop")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                
                    ForEach(0..<self.alarms.count, id: \.self){ buzz in
                    Group{
                        Spacer()
                        if self.alarms[buzz].active == false{
                            
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
                
                    
                    
                    
                    
                    
                    
                    
                }   
            }.navigationBarTitle("Passive Alarms")
            
        
        }
        
    }
}

struct PassiveView_Previews: PreviewProvider {
    static var previews: some View {
        PassiveView(alarms: Binding.constant([Repeater(interval: 5 )]))
    }
}
