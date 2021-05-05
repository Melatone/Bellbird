//
//  RepeaterView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 3/24/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct RepeaterView: View {
    
    @Binding var alarm : Repeater
    
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(self.alarm.hue)
                .frame(width: 350, height: 120, alignment: .center)
            
            
    
            Toggle(isOn: self.$alarm.active){
                Text(" ")
                
            }
            .frame(width: 330, height: 120, alignment: .center)
            
            
            
            Text("\(self.alarm.date.value(for:.hour)!):\(self.alarm.date.value(for:.minute)!)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.trailing, 50.0)
            
            Text("\(self.alarm.meridian)")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading, 70.0)
                .padding(.top, 4.0)
            
            Text("+")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.trailing,290)
            
            Text("\(self.alarm.interval)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.trailing,250)
            
            
            
            
        }
    }
}



struct RepeaterView_Previews: PreviewProvider {
    static var previews: some View {
        RepeaterView(alarm: Binding.constant(Repeater(name: "name", date: DateComponents(hour: 7, minute: 30), interval: 5, hue: Color("BBBlue"), meridian: "AM", active: false)))
    }
}
