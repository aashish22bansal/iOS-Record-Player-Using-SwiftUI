//
//  ContentView.swift
//  Record Player Animation
//
//  Created by Aashish Bansal on 26/02/23.
//

import SwiftUI

struct ContentView: View {
    
    // Creating the Properties for the Record Player
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    
    var body: some View {
        // Adding a Background with Body
        ZStack{
            RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 20, endRadius: 600)
                .scaleEffect(1.2)
            
            // Adding RecordPlayerBox above RadialGradient
            // MARK - RECORD PLAYER
            RecordPlayerBox()
                .offset(y: -100)
            
            // Calling the RecordPlayerView
            // MARK - RECORD
            VStack{
                RecordVIew(degrees: $degrees, shouldAnimate: $shouldAnimate)
                // Calling the ArmView
                // MARK - ARM
                ArmView(rotateArm: $rotateArm)
                
                // Creating a Button to Toggle Play and Pause
                // MARK - BUTTON
                Button(action: {
                    shouldAnimate.toggle() // when it toggles, the record should spin
                    // We want the Button Title to change based on Toggle()
                    if shouldAnimate{
                        degrees = 36000
                        rotateArm.toggle()
                        // Calling the function to play the audio file
                        playSound(sound: "music", type: "m4a")
                    }
                    else{
                        rotateArm.toggle()
                        degrees = 0
                        // Stoping the audio from playing any further
                        audioPlayer?.stop()
                    }
                }){
                    HStack(spacing: 8){
                        if !shouldAnimate{
                            Text("Play")
                            Image(systemName: "play.circle.fill").imageScale(.large)
                        }
                        else{
                            Text("Stop")
                            Image(systemName: "stop.fill").imageScale(.large)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(Color.black, lineWidth: 1.25))
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
