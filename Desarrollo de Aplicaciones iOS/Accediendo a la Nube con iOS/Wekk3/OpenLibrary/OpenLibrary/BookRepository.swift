//
//  BookRepository.swift
//  OpenLibrary
//
//  Created by Carlos Manzanas on 09/10/16.
//  Copyright © 2016 foskon. All rights reserved.
//

import Foundation

class BookRepository {
    
    func getBook(isbn: String, success:((book: Book) -> Void), failure:(() -> Void)) {
        let session = NSURLSession.sharedSession()
        let search = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys={ISBN}"
        let isbnkey = "ISBN:" + isbn
        let searchISBN = search.stringByReplacingOccurrencesOfString("{ISBN}", withString: isbnkey)
        let url = NSURL(string: searchISBN)
        let req = NSURLRequest(URL: url!)
        let task = session.dataTaskWithRequest(req, completionHandler: {
            (data: NSData?, response: NSURLResponse?, error: NSError?) in
            
            guard
                let mData = data
                else {
                    failure()
                    return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(mData, options: .MutableContainers) as! [String: AnyObject]
                let mapper = BookMapper()
                if let book = mapper.getBook(json, isbn: isbnkey) {
                    dispatch_sync(dispatch_get_main_queue(), {
                        print(book)
                        success(book: book)
                    })
                } else {
                    failure()
                }
                
            } catch {
                failure()
            }
        })
        
        task.resume()
    }
}
