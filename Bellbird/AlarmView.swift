//
//  AlarmView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/6/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct AlarmView: View {
    
    @State var isChecked : Bool = false
    @Binding var alarm : Alarm
 
    var body: some View {
        
        ZStack{
       RoundedRectangle(cornerRadius: 30)
           .foregroundColor(Color(self.alarm.color))
       .frame(width: 350, height: 120, alignment: .center)
          
            
            Toggle(isOn: $isChecked){
                   Text(" ")
               
                   } 
            .frame(width: 330, height: 120, alignment: .center)
                
            
        
            Text("\(self.alarm.time.value(for: .hour)!):\(self.alarm.time.value(for: .minute)!)")
                .foregroundColor(.white)
                .font(.largeTitle)
            .bold()
            .padding(.trailing, 50.0)
            
            Text("\(self.alarm.meridian)")
            .foregroundColor(.white)
                .font(.title)
                .padding(.leading, 70.0)
                .padding(.top, 4.0)
            
           
        
        
       
            
            
    }
}
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView(alarm: Binding.constant(Alarm(name: "name",time :  DateComponents(hour:7,minute:30),color: UIColor.black, active: false)))
    }
}
