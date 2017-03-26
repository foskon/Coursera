//
//  Song.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import Foundation

class Song: CustomStringConvertible {
    
    private let title: String
    private let path: URL
    
    init(title: String, path: URL) {
        self.title = title
        self.path = path
    }
    
    func getUrl() -> URL {
        return path
    }
    
    func getTitle() -> String {
        return title
    }
    
    var description: String {
        return "Title: \(title)"
    }
}
