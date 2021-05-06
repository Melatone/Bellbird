//
//  Timebomb.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/27/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
class Timebomb: Alarm{
    var hue :Color
    var date: DateComponents
    var merid:String
    init(name:String = "name",active: Bool = false,merid :String = "AM", date : DateComponents = DateComponents(),hue : Color = Color("BBViolet")){
        self.hue = hue
        self.date = date
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
