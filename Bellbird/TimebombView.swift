//
//  TimebombView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/30/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct TimebombView: View {
    @Binding var bomb : Alarm
    
        var body: some View {
            
            ZStack{
           RoundedRectangle(cornerRadius: 30)
               .foregroundColor(Color(self.bomb.color))
           .frame(width: 350, height: 120, alignment: .center)
              
                
                Toggle(isOn: self.$bomb.active){
                       Text(" ")
                   
                       }
                .frame(width: 330, height: 120, alignment: .center)
                
                    
                
            
                Text("\(self.bomb.time.value(for:.hour)!):\(self.bomb.time.value(for: .minute)!)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                .bold()
                .padding(.trailing, 50.0)
                
                Text("\(self.bomb.meridian)")
                .foregroundColor(.white)
                    .font(.title)
                    .padding(.leading, 70.0)
                    .padding(.top, 4.0)
            
           
                
                
        }
    }
    }

struct TimebombView_Previews: PreviewProvider {
    static var previews: some View {
        TimebombView(bomb: Binding.constant(Timebomb(name: "name", time: DateComponents(hour:7,minute:30),active: false)))
    }
}