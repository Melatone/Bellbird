//
//  AddTimebombView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/26/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//
//newester 7;45

import SwiftUI



struct AddTimebombView: View {
    var colors = ["BBTimeBomb"]
    
    var content = UNMutableNotificationContent()
    var amORpm = ["AM","PM"]
    @State var bomb = Timebomb()
    @Binding var bombs : [Alarm]
    @State var hour = 1
    @State var minute = 0
    @State var picked = "AM"
    var body: some View{
        
        VStack{
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
                Button(action: {
                    let bomber = Timebomb(name: self.bomb.name,  active: self.bomb.active, merid: self.picked, date: DateComponents(hour: self.hour, minute: self.minute), hue: Color("BBTimeBomb"))
                    self.bombs.append(bomber)
                    
                    print("step 1")
                    
                    if self.bomb.date.value(for:.hour) != nil {
                        print(self.bomb.date.value(for:.hour)!)
                    }else {
                        print("first thing sucks")
                    }
                    
                    if self.bomb.date.value(for:.minute) != nil {
                        print(self.bomb.date.value(for:.minute)!)
                    }else {
                        print("second thing sucks")
                    }
                    if (bomber.date.hour) != nil {
                        print(bomber.date.hour!)
                    }else {
                        print("no <3")
                    }
                    if (bomber.date.minute) != nil {
                        print(bomber.date.minute!)
                    }else {
                        print("no <3 minute")
                    }
                    
                    
                    
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                    self.content.title = "Bellbird Timebomb" //title of notification
                    self.content.subtitle = self.bomb.name //description
                    self.content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "blackbird.mp3"))
                    
                    var dateComp = DateComponents()
                    dateComp.hour = bomber.date.hour!
                    dateComp.minute = bomber.date.minute!
                    
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                    
                    // choose a random identifier
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: self.content, trigger: trigger)
                    
                    // add our notification request
                    UNUserNotificationCenter.current().add(request)
                    
                    
                    
                }, label: {
                    Text("Confirm")
                        .foregroundColor(.black)
                })
                
                
            }
            
        }
        
    }
    
    
    
    
    struct AddTimebombView_Previews: PreviewProvider {
        static var previews: some View {
            AddTimebombView(bombs: Binding.constant([Timebomb(name: "name", active: false, date: DateComponents(hour:7,minute:30), hue: Color("BBTimeBomb"))]))
            
        }
    }
}
