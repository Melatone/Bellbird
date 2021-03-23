//
//  ContentView.swift
//  Bellbird
//
//  Created by Brandyn Cronin (student LM) on 3/11/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//
import AVFoundation
import SwiftUI
import Foundation

struct ContentView: View {
    //looks like the AVAudioPlayer is causing issues
    
    //@State private var player: AVAudioPlayer!
    
    //let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //@State private var timeRemainingSeconds = 5
    
    //Leave date here as it might be useful in the future
    //@State private var date = Date()
    

    //default sound for testing
    //let Default = Bundle.main.path(forResource: "Call", ofType: "mp3")!
    
    
    var body: some View {
        VStack{
            Text("hello")
            //Text("alarm branch commit test")
            //importing old framework over and building off of there
            
            //once timer runs down the sound plays and then it resets
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    }
