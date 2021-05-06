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
    var date:DateComponents
    var merid:String
    init(name:String = "name", date : DateComponents = DateComponents(), interval : Int = 5 ,hue : Color = Color("BBViolet"), merid :String = "AM", active: Bool = false){
        self.interval = interval
        self.date = date
        self.hue=hue
        self.merid = merid
        
       
    }
    override func AMorPM() -> Int{
        if merid ==  "PM" && date.value(for: .hour)! <= 11{
            return time.value(for:.hour)!*2
                }
        if merid ==  "PM" && date.value(for: .hour)! == 12{
               return time.value(for:.hour)!-12
       
            }
        return date.value(for:.hour)!
       
    }
   
 
   
}
