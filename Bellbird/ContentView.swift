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
    //it works now, ignore the weird error "No factory registered etc."
    
    @State private var player: AVAudioPlayer!
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //adding a timer to test running a sound for a certain amount of time/repeating
    let timerTwo = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var timeRemainingSeconds = 5
    //added new thing to attempt to try and play sound for a minute
    //Commented out for time being
    //@State private var timeSoundPlay = 60
    
    
    
    
    //Do we need date? Just leaving it here just in case its useful in the future
    //@State private var date = Date()
    

    //default sound for testing
    //so the first error here was that i had renamed the file so that it wasn't an mp3 anymore...whoops
    //Don't do that
    let pitch = Bundle.main.path(forResource: "Call", ofType: "mp3")!
    
    
    
    
    
    var body: some View {
        VStack{
            Text("\(timeRemainingSeconds)").onReceive(timer){value in
                if(self.timeRemainingSeconds>0){
                    print("bruh moment")
                    self.timeRemainingSeconds-=1
                }else{
                    
                    //added sound to test repeating/playing a sound for a certain amount of time
                    
                    //play sound for a certain amount of time/repeat
                    //ok i got errors with the old method I tried time to run another routine
                    //use a wait timer is what stack overflow likes
                    
                    //the below code works commenting out for testing purposes
                    
                    
                    
                    do{let url = URL(fileURLWithPath: self.pitch)
                        
                        
                        self.player = try AVAudioPlayer(contentsOf: url)
                        //self.player.numberOfLoops = 0
                        
                        //so this loops but it loops forever
                        let timeLimit = 1.0
                        
                        self.player.play()
                        //hopefully this stops the sound from playing
                        Timer.scheduledTimer(withTimeInterval: timeLimit, repeats: false) { (timer) in
                            self.player.stop()
                        }
                           
                        
                        //self.player.stop()
                            
                            //self.timeSoundPlay-=1
                        
                        
                        
                        
                        
                    }catch{
                        //catch is just in case
                        //print("no")
                    }
                    //i need this to reset after a certain time
                    DispatchQueue.main.asyncAfter(deadline: .now() + 20.0){
                        print("delay")
                        self.timeRemainingSeconds = 5
                    }
                        }
                
                
            
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
}
