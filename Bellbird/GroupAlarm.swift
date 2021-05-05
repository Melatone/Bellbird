//
//  GroupAlarm.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/19/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import Foundation
import UIKit
class GroupAlarm : Alarm{

    var times:[ComplexDate]

   
    init(name:String = "name", times : [ComplexDate] = [ComplexDate(date: DateComponents(), active: false, meridian: "AM")], color:UIColor = UIColor(named:"BBMint")! ){
        
        self.times = times
        
    }
 
   
}

struct ComplexDate: Hashable{
    var date : DateComponents
    var active : Bool
    var meridian : String
}
