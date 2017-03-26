//
//  Song.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import Foundation

class Song {
    
    private let name: String
    private let path: URL
    
    init(name: String, path: URL) {
        self.name = name
        self.path = path
    }
    
    func getUrl() -> URL {
        return path
    }
}
