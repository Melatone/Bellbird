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

        var body: some View{
            
            
            
            Form{
                TextField("Enter Name", text: self.$repeater.name)
                Picker(selection: self.$repeater.color, label:  Text("Color")){
                
                ForEach(colors, id: \.self){ color in
                    
                    Color.init(color)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                    
                    
                    
                    
                    
                }
            }
                
                     Picker(selection:self.$repeater.meridian , label:  Text("Time")){
                                       
                                       ForEach(amORpm, id: \.self) { time in
                                         Text("\(time)")
                                       }
                                   }.pickerStyle(SegmentedPickerStyle())
                                       .labelsHidden()
                                   HStack{
                                        
                                   Picker(selection: self.$repeater.time.hour, label:  Text("Time")){
                                       
                                       ForEach(1...12, id: \.self) { int in
                                         Text("\(int)")
                                           
                                               
                                       }
                                      
                                   }.pickerStyle(WheelPickerStyle())
                                       .labelsHidden()
                                       .frame(width: 100, height: 200, alignment: .center)
                                       
                                       
                                       
                                   Picker(selection: self.$repeater.time.minute, label:  Text("Time")){
                                       
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
                    self.repeats.append(self.repeater)
                }, label: {
                 Text("Confirm")
                     .foregroundColor(.black)
                })
            }
        
    }


    }

struct AddRepeaterView_Previews: PreviewProvider {
    static var previews: some View {
        AddRepeaterView(repeats: Binding.constant([Repeater(name: "name", time: DateComponents(hour:7,minute:30), interval: 5, color: UIColor(named:"BBPink")!, meridian: "AM")]))
    }
}
