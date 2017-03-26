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
    var currentIndex = -1
    var isStopped = true
    
    init(songs: [Song]) {
        self.songs = songs
        self.player = PlayerAVFoundation()
    }
    
    func play(songId: String) {
        if let songIndex = getSongIndex(songId: songId) {
            currentIndex = songIndex
            player.play(song: songs[currentIndex])
            isStopped = false
        }
    }
    
    func play() {
        if (currentIndex != -1) {
            if (isStopped) {
                player.play(song: songs[currentIndex])
            } else {
                player.play()
            }
            isStopped = false
        }
    }
    
    func stop() {
        player.stop()
        isStopped = true
    }
    
    func pause() {
        player.stop()
    }
    
    func shuffle() {
        var randomIndex = Int(arc4random_uniform(UInt32(songs.count)))
        if randomIndex == currentIndex {
            randomIndex = (randomIndex + 1) % songs.count
        }
        currentIndex = randomIndex
        play(songId: songs[currentIndex].getId())
    }
    
    private func getSongIndex(songId: String) -> Int? {
        let index = songs.index { (song) -> Bool in
            return song.getId() == songId
        }
        
        return index
    }
}
