//
//  AddTimebombView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/26/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI



struct AddTimebombView: View {
     var colors = ["BBTimeBomb"]
    
    var amORpm = ["AM","PM"]
    @State var bomb = Timebomb()
    @Binding var bombs : [Alarm]
           var body: some View{
            
               
               Form{
                TextField("Enter Name", text: self.$bomb.name)
              
                HStack{
                    Text("Color")
                
                   ForEach(colors, id: \.self){ color in
                      
                    Color.init(color)
                           .cornerRadius(20)
                           .shadow(radius: 3)
                    
                   
                       
                    }
                       
                   }
                Picker(selection:self.$bomb.meridian , label:  Text("Time")){
                    
                    ForEach(amORpm, id: \.self) { time in
                      Text("\(time)")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                HStack{
                     
                Picker(selection: self.$bomb.time.hour, label:  Text("Time")){
                    
                    ForEach(1...12, id: \.self) { int in
                      Text("\(int)")
                        
                            
                    }
                   
                }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    .frame(width: 100, height: 200, alignment: .center)
                    
                    
                    
                Picker(selection: self.$bomb.time.minute, label:  Text("Time")){
                    
                    ForEach(00..<60, id: \.self) { int in
                      Text("\(int)")
                    }
                    
                    
                }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    .frame(width: 20, height: 100, alignment: .leading)
                    
            }
                  
              
           Button(action: {
            self.bombs.append(self.bomb)
           }, label: {
            Text("Confirm")
                .foregroundColor(.black)
           })
            }
       }
   

       


struct AddTimebombView_Previews: PreviewProvider {
    static var previews: some View {
        AddTimebombView(bombs: Binding.constant([Timebomb(name: "name", time: DateComponents(hour:7,minute:30),active: false)]))
        
    }
}
}
