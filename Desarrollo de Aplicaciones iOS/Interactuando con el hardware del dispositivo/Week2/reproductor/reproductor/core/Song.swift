//
//  Song.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import Foundation

class Song: CustomStringConvertible {
    
    private let id: String
    private let title: String
    private let path: URL
    private let thumb: URL
    
    init(title: String, path: URL, thumb: URL) {
        self.id = path.absoluteString
        self.title = title
        self.path = path
        self.thumb = thumb
    }
    
    func getId() -> String {
        return id
    }
    
    func getUrl() -> URL {
        return path
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getThumbUrl() -> URL {
        return thumb
    }
    
    var description: String {
        return "Title: \(title)"
    }
}
