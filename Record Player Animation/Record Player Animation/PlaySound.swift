//
//  PlaySound.swift
//  Record Player Animation
//
//  Created by Aashish Bansal on 26/02/23.
//

import Foundation
import AVFoundation

// Instantiating an Audio Player Object
var audioPlayer: AVAudioPlayer?

// Finding the FIle in the bundle
func playSound(sound: String, type: String){
    // we will have to unwrap it
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            // Trying to play it
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        catch{
            print("Could not find the file")
        }
    }
}
