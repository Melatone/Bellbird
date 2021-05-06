//
//  AddRepeaterView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/26/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

struct AddRepeaterView: View {
    var colors = ["BBBlue","BBGreen","BBLime","BBViolet","BBCyan","BBBrown","BBYellow","BBRed","BBOrange","BBMint","BBPink",]

    var amORpm = ["AM","PM"]
    @State var repeater = Repeater()
    @Binding var repeats : [Alarm]
    @State var interval : Int = 5
    @State var colorPicked = "BBLime"
    @State var hour = 1
    @State var minute = 0
    @State var picked = "AM"
        var body: some View{
            
            
            
            Form{
                TextField("Enter Name", text: self.$repeater.name)
               
                Picker(selection: self.$colorPicked, label:  Text("Color")){
                
                ForEach(colors, id: \.self){ color in
                    
                    Color.init(color)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                    
                    
                    
                    
                    
                    }
                    }.pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                
                Picker(selection:self.$picked , label:  Text("Time")){
                                       
                                       ForEach(amORpm, id: \.self) { time in
                                         Text("\(time)")
                                       }
                                   }.pickerStyle(SegmentedPickerStyle())
                                       .labelsHidden()
                                   HStack{
                                        
                                   Picker(selection: self.$hour, label:  Text("Time")){
                                       
                                       ForEach(1...12, id: \.self) { int in
                                         Text("\(int)")
                                           
                                               
                                       }
                                      
                                   }.pickerStyle(WheelPickerStyle())
                                       .labelsHidden()
                                       .frame(width: 100, height: 200, alignment: .center)
                                       
                                       
                                       
                                   Picker(selection: self.$minute, label:  Text("Time")){
                                       
                                       ForEach(00..<60, id: \.self) { int in
                                         Text("\(int)")
                                       }
                                       
                                       
                                   }.pickerStyle(WheelPickerStyle())
                                       .labelsHidden()
                                       .frame(width: 20, height: 100, alignment: .leading)
                                       
                               }
                
                Stepper( "Sound every \(interval) minutes", onIncrement: {
                    self.interval+=1
                    self.repeater.interval=self.interval
                }, onDecrement: {
                    self.interval-=1
                    self.repeater.interval=self.interval
                })
                
                
                
                Button(action: {
                    let repeating = Repeater(name: self.repeater.name, date: DateComponents(hour:self.hour, minute:self.minute), interval: self.repeater.interval, hue: Color(self.colorPicked), merid: self.picked, active: self.repeater.active)
                    self.repeats.append(repeating)
                }, label: {
                 Text("Confirm")
                     .foregroundColor(.black)
                })
            }
        
    }


    }

struct AddRepeaterView_Previews: PreviewProvider {
    static var previews: some View {
        AddRepeaterView(repeats: Binding.constant([Repeater(name: "Name", date: DateComponents(hour:7,minute:30), interval: 5, hue: Color("BBRed"), merid: "AM", active: true)]))
    }
}
