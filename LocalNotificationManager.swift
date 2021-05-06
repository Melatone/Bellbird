//
//  LocalNotificationManager.swift
//  Bellbird
//
//  Created by Robert Fleur (student LM) on 5/6/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//
import SwiftUI
import Foundation
import UIKit
import AVFoundation

class LocalNotificationManager: ObservableObject {
    
    var content = UNMutableNotificationContent()
    var notifications = [Notification]()
    
    func sendNotification(title: String, subtitle: String?, body: String, launchIn: Double) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        if let subtitle = subtitle {
            content.subtitle = subtitle
        }
        content.body = body
        
        
    }
}
