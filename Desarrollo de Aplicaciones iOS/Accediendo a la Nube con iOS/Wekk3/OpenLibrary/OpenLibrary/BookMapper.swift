//
//  BookMapper.swift
//  OpenLibrary
//
//  Created by Carlos Manzanas on 09/10/16.
//  Copyright © 2016 foskon. All rights reserved.
//

import Foundation

class BookMapper {
    func getBook(json:[String: AnyObject], isbn: String) -> Book? {
        print(json)
        
        var title = ""
        var authors:[String] = []
        var cover = ""
        
        if let jsonBook = json[isbn] {
            
            if let jsonAuthors = jsonBook["authors"] as! [[String: AnyObject]]? {
                for jsonItem in jsonAuthors {
                    if let name = jsonItem["name"] as! String? {
                        authors.append(name)
                    }
                }
            }
            
            if let jsonTitle = jsonBook["title"] as! String? {
                title = jsonTitle
            }
            
            if let jsonCover = jsonBook["cover"] as! [String: String]? {
                if let jsonCoverUrl = jsonCover["medium"] as String? {
                    cover = jsonCoverUrl
                }
            }
        }
        
        if (title == "" && authors.count == 0 && cover == "") {
            return nil
        }
        
        return Book(title: title, author: authors, cover: cover)
    }
}
