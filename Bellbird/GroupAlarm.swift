//
//  GroupAlarm.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/19/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
class GroupAlarm : Alarm{

    var times:[ComplexDate]
    var hue: Color
   
    init(name:String = "name", times : [ComplexDate] = [ComplexDate(date: DateComponents(), active: false, meridian: "AM")], hue: Color = Color("BBMint") ){
        
        self.times = times
        self.hue = hue
        
    }
 
   
}


struct ComplexDate: Hashable{
    var date : DateComponents
    var active : Bool
    var meridian : String
}
