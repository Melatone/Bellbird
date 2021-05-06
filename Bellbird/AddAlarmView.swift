//
//  AddAlarmView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/26/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import SwiftUI

enum PickView: String, CaseIterable{
    case group = "Group"
    case timebomb = "Timebomb"
    case repeater = "Repeater"
}

struct AddAlarmView: View {
    @State private var picker : PickView = .group
    @Binding var alarms: [Alarm]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    
                    
                    
                    
                    Picker(selection: $picker, label:  Text("Type")){
                        ForEach(PickView.allCases, id: \.self){
                            Text($0.rawValue)
                            
                            
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                        .navigationBarTitle("Add Alarm")
                }
                ShowView(selected:picker, alarms: $alarms)
                
                
            }
            
        }
    }
    
    struct ShowView: View{
        var selected:PickView
        @Binding var alarms : [Alarm]
        
        var body: some View{
            switch selected{
            case .group:
                return  AnyView(AddGroupView(groupAlarms: $alarms)).frame(width:370,height:700, alignment: .center)
            case .repeater:
                return  AnyView(AddRepeaterView(repeats: $alarms))
                    .frame(width:370,height:700, alignment: .center)
            case .timebomb:
                return  AnyView(AddTimebombView(bombs: $alarms))
                    .frame(width:370,height:700, alignment: .center)
                
            }
        }
    }
    struct AddAlarmView_Previews: PreviewProvider {
        static var previews: some View {
            AddAlarmView(alarms: Binding.constant([Repeater(name: "name", date: DateComponents(hour:7,minute:30), interval: 5, hue: Color("BBPink"), merid: "AM")]))
        }
    }
}

