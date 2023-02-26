//
//  RecordVIew.swift
//  Record Player Animation
//
//  Created by Aashish Bansal on 26/02/23.
//

// Here, we have two binding properties:
// 1. Set Degree of Rotation of Record
// 2. Check Animation
// These will be bound to the ContentView struct.

import SwiftUI

struct RecordVIew: View {
    
    // Creating Properties
    @Binding var degrees: Double
    @Binding var shouldAnimate: Bool
    
    var body: some View {
        // Adding the Image
        Image("record")
            .resizable()
            .frame(width: 275, height: 275)
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
            .rotationEffect(Angle.degrees(degrees))
            .animation(Animation.linear(duration: shouldAnimate ? 60:0).delay(1.5))
        
    }
}

struct RecordVIew_Previews: PreviewProvider {
    static var previews: some View {
        RecordVIew(degrees: .constant(2.0), shouldAnimate: .constant(true))
            .previewLayout(.sizeThatFits).padding()
    }
}
