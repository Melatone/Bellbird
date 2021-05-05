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
    var hue : Color
    var date : DateComponents
    init(name:String = "name",date : DateComponents = DateComponents(),active: Bool = false,meridian :String = "AM", hue: Color = Color("BBTimeBomb"),time : DateComponents = DateComponents(),color : Color = Color("BBViolet")){
        self.hue = hue
        self.date = date
       
    }
 
   

}
