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
    var sounds = ["Goose", "Call", "Raven", "blackbird", "harpy", "Mourning_Dove", "Cardinal", "owl", "Warbler", "Robin"]
    @State private var selectedSound = "Call"
    //use this component to play the sound UwU
    
    //let soundData = NSDataAsset(name: selectedSoundString)
    
     @State private var player: AVAudioPlayer!
   
    
    //need to be able to access the sound library
    
    
       @State var blip = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       //adding a timer to test running a sound for a certain amount of time/repeating
    
       
       
    @State private var timeLimit = 20.0
       @State private var timeRemainingSeconds = 5
       //added new thing to attempt to try and play sound for a minute
       //Commented out for time being
       //@State private var timeSoundPlay = 60
       
       
       
       
       //Do we need date? Just leaving it here just in case its useful in the future
       //@State private var date = Date()
       

       //default sound for testing
       //so the first error here was that i had renamed the file so that it wasn't an mp3 anymore...whoops
       //Don't do that
    //need a way to change the sound
    //make the name a variable? Somehow?
    
    //Could possibly change the method the sound is played? I don't understand it
    //Cannot modify the variable so we have to pass it through a function to make it immutable
    
       let pitch = Bundle.main.path(forResource: "Call", ofType: "mp3")!
    //Rob knows how to change between sounds so this has been deprecated
    //change time interval i guess? that's easy
    
    //basically im just gonna hardcode this in stupidly
    //Basically, if statement the hell away and if the picker is so and so use this pitch
    //let pitchTwo = Bundle.main.path(forResource: "Goose", ofType: "mp3")!
    //let pitchThree = Bundle.main.path(forResource: "Robin", ofType: "mp3")!
    
      
       
       
       
       
       
       var body: some View {
           VStack{
            //idk how button works ill just uhhhhhh
            Button("change the time interval"){
                //invalidates timer so that it doesn't get messed up
                //why isn't it working...
                self.timeRemainingSeconds+=1
            }
            //make picker here and use ifstatement bus
            
           
           
               Text("\(timeRemainingSeconds)").onReceive(blip){value in
                   if(self.timeRemainingSeconds>0){
                       //print("bruh moment")
                       self.timeRemainingSeconds-=1
                   }else{
                       self.blip.upstream.connect().cancel()
                       //added sound to test repeating/playing a sound for a certain amount of time
                       
                       //play sound for a certain amount of time/repeat
                       //ok i got errors with the old method I tried time to run another routine
                       //use a wait timer is what stack overflow likes
                       
                       //the below code works commenting out for testing purposes
                       
                       
                       
                       do{
                        
                        let url = URL(fileURLWithPath: self.pitch)
                           
                           
                           self.player = try AVAudioPlayer(contentsOf: url)
                           
                           //this works what is mainly the problem now is the timer bugging out
                           //let timeLimit = 20.0
                           
                           
                               self.player.play()
                           
                           
                           //hopefully this stops the sound from playing
                        Timer.scheduledTimer(withTimeInterval: self.timeLimit, repeats: false) { (timer) in
                               
                              
                               
                               
                               self.player.stop()
                               
                               timer.invalidate()
                               //what is weird here is that it should just reset once but it is not doing that?
                               
                               //THIS IS SO HYPE IT WORKS NOW
                           
                               self.timeRemainingSeconds=5
                               self.blip = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                               //invalidate the timer after this and start over?
                               
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

