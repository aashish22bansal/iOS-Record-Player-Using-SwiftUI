//
//  RecordPlayerBox.swift
//  Record Player Animation
//
//  Created by Aashish Bansal on 26/02/23.
//

// This file is to Animate the Box for the Record Player Image

import SwiftUI

struct RecordPlayerBox: View {
    var body: some View {
        // Import the Rectangle Image and add Shadow
        ZStack{
            Rectangle()
                .frame(width: 345, height: 345)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

struct RecordPlayerBox_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerBox()
    }
}
