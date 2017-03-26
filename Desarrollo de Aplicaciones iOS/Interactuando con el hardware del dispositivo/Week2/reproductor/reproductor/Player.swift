//
//  Player.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import Foundation
import AVFoundation

protocol Player {
    
    func play(song: Song)
    func stop()
}

class PlayerAVFoundation: Player {
    
    var player: AVAudioPlayer!
    
    init() {
        self.player = AVAudioPlayer()
    }
    
    // Player
    internal func stop() {
        
    }
    
    internal func play(song: Song) {
        do {
            player = try AVAudioPlayer(contentsOf: song.getUrl())
            player.play()
        } catch {
            print("ERROR Playing")
        }
    }
}
