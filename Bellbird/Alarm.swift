//
//  Alarm.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 3/24/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
class Alarm:ObservableObject{
    var name:String
    var time:DateComponents
 
    var color: Color
    var active:Bool
    var meridian:String
    
    init(name:String = "",time : DateComponents = DateComponents(), color: Color = Color("BBYellow") ,active: Bool = true, meridian : String = ""){
        self.name = name
        self.time = time
        self.meridian = meridian
        self.color = color
        self.active = active

        
       
    }
    
 func AMorPM() -> Int{
     if meridian ==  "PM" && time.value(for: .hour)! <= 11{
         return time.value(for:.hour)!*2
             }
     if meridian ==  "PM" && time.value(for: .hour)! == 12{
            return time.value(for:.hour)!-12
    
         }
     return time.value(for:.hour)!
    
 }
   
}
