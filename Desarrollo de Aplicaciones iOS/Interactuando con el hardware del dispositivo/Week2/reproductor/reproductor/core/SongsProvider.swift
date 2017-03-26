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
            let song1Img = Bundle.main.url(forResource: "song1_img", withExtension: "jpeg"),
            let song2Data = Bundle.main.url(forResource: "song2", withExtension: "mp3"),
            let song2Img = Bundle.main.url(forResource: "song2_img", withExtension: "jpeg"),
            let song3Data = Bundle.main.url(forResource: "song3", withExtension: "mp3"),
            let song3Img = Bundle.main.url(forResource: "song3_img", withExtension: "jpeg"),
            let song4Data = Bundle.main.url(forResource: "song4", withExtension: "mp3"),
            let song4Img = Bundle.main.url(forResource: "song4_img", withExtension: "jpeg") else {
                print("ERROR - Could not load data")
                fatalError()
        }
            
        let song1 = Song(title: "Super String Theory (ID 474)", path: song1Data, thumb: song1Img)
        let song2 = Song(title: "Doctor's In", path: song2Data, thumb: song2Img)
        let song3 = Song(title: "Lay Down", path: song3Data, thumb: song3Img)
        let song4 = Song(title: "Alice", path: song4Data, thumb: song4Img)
        
        self.songs = [song1, song2, song3, song4]
    }
    
    func getSongs() -> [Song] {
        return songs
    }
}
