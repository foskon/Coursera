//
//  SongsProvider.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import Foundation

class SongsProvider {
    
    private let songs: [Song]
    
    init() {
        // Create songs
        guard
            let song1Data = Bundle.main.url(forResource: "song1", withExtension: "mp3"),
            let song2Data = Bundle.main.url(forResource: "song2", withExtension: "mp3"),
            let song3Data = Bundle.main.url(forResource: "song3", withExtension: "mp3"),
            let song4Data = Bundle.main.url(forResource: "song4", withExtension: "mp3") else {
                print("ERROR - Could not load data")
                fatalError()
        }
            
        let song1 = Song(name: "Super String Theory (ID 474)", path: song1Data)
        let song2 = Song(name: "Doctor's In", path: song2Data)
        let song3 = Song(name: "Lay Down", path: song3Data)
        let song4 = Song(name: "Alice", path: song4Data)
        
        self.songs = [song1, song2, song3, song4]
    }
    
    func getSongs() -> [Song] {
        return songs
    }
}
