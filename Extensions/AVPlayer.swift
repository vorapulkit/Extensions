//
//  AVPlayer.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension AVPlayer {
    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
}
