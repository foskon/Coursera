//
//  PlayerClient.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import Foundation

class PlayerClient {
    
    let songs: [Song]
    let player: PlayerAVFoundation
    
    init(songs: [Song]) {
        self.songs = songs
        self.player = PlayerAVFoundation()
    }
    
    func play(songId: String) {
        if let song = getSong(songId: songId) {
            player.play(song: song)
        }
    }
    
    private func getSong(songId: String) -> Song? {
        let index = songs.index { (song) -> Bool in
            return song.getId() == songId
        }
        
        return index != nil ? songs[index!] : nil
    }
}
