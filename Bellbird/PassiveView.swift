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
                                
                               
                              
                                    
                                
                                    
                                
                        
                            .foregroundColor(Color("BackAccent"))
                            }.navigationBarTitle("Passive Alarms")
                          
                        }
                           
                }
           }

struct PassiveView_Previews: PreviewProvider {
    static var previews: some View {
        PassiveView(alarms: Binding.constant([Repeater(interval: 5 )]))
    }
}
