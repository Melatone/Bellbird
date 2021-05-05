//
//  Repeater.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/30/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
class Repeater: Alarm{
  
    var interval:Int
    var hue:Color
    var date: DateComponents
    init(name:String = "name", date : DateComponents = DateComponents(), time : DateComponents = DateComponents(), interval : Int = 5 , hue:Color = Color("BBViolet"),color : Color = Color("BBViolet"), meridian :String = "AM", active: Bool = false){
        self.interval = interval
        self.date = date
        self.hue = hue
       
    }
   
 
   
}
