//
//  Alarm.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 3/24/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import Foundation
import UIKit
class Alarm:ObservableObject{
    var name:String
    var time:DateComponents
    var type: String
    var color:UIColor
    var active:Bool
    var meridian:String
    
    init(name:String = "name",time : DateComponents = DateComponents(),color:UIColor=UIColor(),active: Bool = false, meridian : String = "AM", type : String = "alarm"){
        self.name = name
        self.time = time
        self.meridian = meridian
        self.color = color
        self.active = active
        self.type = type
        
       
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
