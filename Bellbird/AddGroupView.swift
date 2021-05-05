//
//  AddGroupView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/26/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct AddGroupView: View {
    
    var colors = ["BBBlue","BBGreen","BBLime","BBViolet","BBCyan","BBBrown","BBYellow","BBRed","BBOrange","BBMint","BBPink",]
    var numbers = [ 1,2,3,4,5,6,7,8,9,10,11,12]
    @State var colorPicked = "BBPink"
    var amORpm = ["AM","PM"]
    
    @State var groupAlarm = GroupAlarm()
    @Binding var groupAlarms : [Alarm]
    
    var body: some View{
        VStack{
        Form{
            
            TextField("Enter Name", text: self.$groupAlarm.name)
            
            
            Picker(selection: self.$groupAlarm.hue, label:  Text("Color")){
                
                ForEach(colors, id: \.self){ color in
                    
                    Color.init(color)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                    
                    
                    
                    
                    
                }
            }
         
            
            ForEach(0..<self.groupAlarm.times.count-1, id: \.self) { buzzer in
                Group{
                
                    Picker(selection: self.$groupAlarm.times[buzzer].meridian , label:  Text("Time")){
                        
                        ForEach(self.amORpm, id: \.self) { time in
                            Text("\(time)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .labelsHidden()
            
                HStack{
                    
                    Picker(selection: self.$groupAlarm.times[buzzer].date.hour, label:  Text("Time")){
                        
                        ForEach(self.numbers, id: \.self) { int in
                            Text("\(int)")
                            
                            
                        }
                        
                    }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                        .frame(width: 100, height: 200, alignment: .center)
                    
                    
                    
                    Picker(selection: self.$groupAlarm.times[buzzer].date.minute, label:  Text("Time")){
                        
                        ForEach(00..<60, id: \.self) { int in
                            Text("\(int)")
                        }
                        
                        
                    }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                        .frame(width: 20, height: 100, alignment: .leading)
                    
                
                    }
                    
                }
                
            }
            
            
            
            
            
            
            
            Button(action: {
                self.groupAlarms.append(self.groupAlarm)
            }, label: {
                Text("Confirm")
                    .foregroundColor(.black)
            })
          
            
        }
        Button(action:{
            self.groupAlarm.times.append(ComplexDate(date:DateComponents(),active: false, meridian: "AM")) },
               label:  {
                Image(systemName: "plus")
        })
    }
    }
    
    
    
    
    
    
    struct AddGroupView_Previews: PreviewProvider {
        static var previews: some View {
            AddGroupView(groupAlarms: Binding.constant([GroupAlarm(name: String() , times: [ComplexDate(date: DateComponents(), active: false, meridian: "AM")],  hue: Color("BBCyan"))]))
        }
    }
}

