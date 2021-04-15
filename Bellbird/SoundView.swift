//
//  SoundView.swift
//  Bellbird
//
//  Created by Annie Wang (student LM) on 4/15/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//
import AVFoundation
import SwiftUI

//Sound View for the Default noise
struct SoundView: View {
    //plays the audio
    @State private var player: AVAudioPlayer!
    //need a variable for the time the alarm will sound
    let blip = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //testing timer before we do anything else 
    @State private var timeRemainingSeconds = 5
    //sound
    let pitch = Bundle.main.path(forResource: "Call", ofType: "mp3")!
    
    
    
    
    var body: some View {
        
            Text("\(timeRemainingSeconds)").onReceive(blip){value in
            if(self.timeRemainingSeconds>0){
                print("bruh moment")
                self.timeRemainingSeconds-=1
            }
        
    }
}

struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        SoundView()
    }
}
}
