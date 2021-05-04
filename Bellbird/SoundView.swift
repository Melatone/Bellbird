//
//  SoundView.swift
//  Bellbird
//
//  Created by Annie Wang (student LM) on 4/15/21.
//  Copyright © 2021 Brandyn Cronin (student LM). All rights reserved.
//
import AVFoundation
import SwiftUI
import MediaPlayer

//Repeater View
//Sound View for the Default noise
//The time interval needs to be changeable

struct SoundView: View {
    //considering on working on my own version of picking sounds later, but for now this is all deprecated
    //var sounds = ["Goose", "Call", "Raven", "blackbird", "harpy", "Mourning_Dove", "Cardinal", "owl", "Warbler", "Robin"]
    //@State private var selectedSound = "Call"
    
    
    
    //Player for the sound
     @State private var player: AVAudioPlayer!
   //Timer
       @State var blip = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       
       
      //How long the sound plays/how long until the timer resets
    @State private var timeLimit = 20.0
    //How much time the timer spends to run down to zero
       @State private var timeRemainingSeconds = 5
       
       
       
       
       
      
       
       //so the first error here was that i had renamed the file so that it wasn't an mp3 anymore...whoops
       //Don't do that
    
    //Sound the player plays
    //Used to want to hard code to change sound but that is not needed
       let pitch = Bundle.main.path(forResource: "Call", ofType: "mp3")!
    
    //Rob knows how to change between sounds so there was no need to
    //hardcode to change sound
    
       
       
       
       
       
       var body: some View {
           VStack{
            //Button for changing the timeRemainingSeconds (WIP)
            Button("change the time interval"){
                //invalidates timer so that it doesn't get messed up
                //why isn't it working...
                
                self.timeRemainingSeconds+=1
            }
            //make picker here and use ifstatement bus
            
           
           //Shows how much time remaining in seconds until the alarm sounds
               Text("\(timeRemainingSeconds)").onReceive(blip){value in
                   if(self.timeRemainingSeconds>0){
                      //subtracts one for every second timeRemainingSeconds is not zero
                       self.timeRemainingSeconds-=1
                    //once timeRemainingSeconds is zero this runs
                   }else{
                    //invalidates the timer
                       self.blip.upstream.connect().cancel()
                       //added sound to test repeating/playing a sound for a certain amount of time
                       
                       
                       
                       do{
                        
                        let url = URL(fileURLWithPath: self.pitch)
                           
                           //loads up the sound
                           self.player = try AVAudioPlayer(contentsOf: url)
                           
                          
                           
                           //plays the sound
                               self.player.play()
                           
                           
                           //hopefully this stops the sound from playing
                        //for 20 seconds the sound plays
                        Timer.scheduledTimer(withTimeInterval: self.timeLimit, repeats: false) { (timer) in
                               
                              
                               
                               //after the 20 seconds the player stops
                               self.player.stop()
                               
                               
                              
                           //the time resets
                               self.timeRemainingSeconds=5
                            //the timer is revalidated
                               self.blip = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                               
                               
                           }
                           
                    
                           
                       }catch{
                           print("no")
                           //catch is just in case
                           
                       }
                       

                       

                           }

                   
                   
               
struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        SoundView()
    }
}
}
}
}
}

