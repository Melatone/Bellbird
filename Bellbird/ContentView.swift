//
//  ContentView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 3/11/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    init() {
    UITabBar.appearance().barTintColor = UIColor(named: "BackAccent")!
 UITabBar.appearance().unselectedItemTintColor = UIColor.white

 }
    
  //  @State var alarms : [Alarm] = [Repeater(name: "name", date: DateComponents(hour: 7, minute: 30), interval: 5, hue: Color( "BBYellow"), merid: "AM", active: false)]
    
    //init(name:String = "name", times : [ComplexDate] = [ComplexDate(date: DateComponents(), active: false, meridian: "AM")], hue: Color = Color("BBMint") ){
    
    @State var alarms: [Alarm] = [GroupAlarm(name:"Group!!", times : [ComplexDate(date: DateComponents(hour : 11, minute : 14),active: true, meridian: "AM"),ComplexDate(date: DateComponents(hour : 11, minute : 18),active: true, meridian: "AM"),ComplexDate(date: DateComponents(hour : 11, minute : 26),active: false, meridian: "AM"),ComplexDate(date: DateComponents(hour : 12, minute : 12),active: false, meridian: "AM"),ComplexDate(date: DateComponents(hour : 2, minute : 45),active: true, meridian: "AM")], hue: Color("BBMint"))]
    
  
    var body: some View {
        TabView{
            ActiveView(alarms: $alarms)
                
                .tabItem{
                    
                    Image(systemName: "speaker.fill")
                    
                        
                    Text("Active")
                    
            }
            
            
            PassiveView(alarms: $alarms)
                .tabItem{
                    Image(systemName: "speaker.zzz.fill")
                    Text("Passive")
                       
            }
        }.accentColor(Color("BBOrange"))
           
            
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


