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
    
    @State var alarms : [Alarm] = [Repeater(name: "name", time: DateComponents(hour: 7, minute: 30), interval: 5, color: UIColor(named: "BBRed")!, meridian: "AM", active: false)]
    
  
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


