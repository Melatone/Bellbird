//
//  Repeater.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 4/30/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//

import Foundation
import UIKit
class Repeater: Alarm{
  
    var interval:Int
  
    init(name:String = "name",time : DateComponents = DateComponents(), interval : Int = 5 , color:UIColor = UIColor(named: "BBPink")!,meridian :String = "AM", active: Bool = false){
        self.interval = interval
       
    }
 
   
}
