//
//  TimebombView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/30/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct TimebombView: View {
    @Binding var bomb : Timebomb
    
        var body: some View {
            
            ZStack{
           RoundedRectangle(cornerRadius: 30)
            .foregroundColor(self.bomb.hue)
           .frame(width: 350, height: 120, alignment: .center)
              
                
                Toggle(isOn: self.$bomb.active){
                       Text(" ")
                   
                       }
                .frame(width: 330, height: 120, alignment: .center)
                
                    
                
            
                Text("\(self.bomb.date.value(for:.hour)!):\(self.bomb.date.value(for: .minute)!)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                .bold()
                .padding(.trailing, 50.0)
                
                Text("\(self.bomb.merid)")
                .foregroundColor(.white)
                    .font(.title)
                    .padding(.leading, 70.0)
                    .padding(.top, 4.0)
            
           
                
                
        }
    }
    }

struct TimebombView_Previews: PreviewProvider {
    static var previews: some View {
        TimebombView(bomb: Binding.constant(Timebomb(name: "name",active: false, date: DateComponents(hour:7,minute:30), hue: Color("BBTimeBomb"))))
    }
}
