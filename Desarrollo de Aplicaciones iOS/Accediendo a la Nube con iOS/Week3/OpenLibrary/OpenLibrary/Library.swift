//
//  Library.swift
//  OpenLibrary
//
//  Created by Carlos Manzanas on 09/10/16.
//  Copyright © 2016 foskon. All rights reserved.
//

import Foundation

class Library {
    
    private let repository = BookRepository()
    private var cache: [Book] = []
    
    static let sharedInstance = Library()
    
    private init() {
        self.initCache()
    }
    
    func getSearches() -> [Book] {
        return self.cache
    }
    
    func getBook(isbn: String, success:((book: Book) -> Void), failure:(() -> Void)) {
        self.repository.getBook(isbn, success: { (book) in
            self.cache.append(book)
            success(book: book)
        }) {
            failure()
        }
    }
    
    func initCache() {
//        if let diskData = NSUserDefaults.standardUserDefaults().objectForKey("cache") {
//            let arrayDiskBooks = diskData as! [AnyObject]
//            let bookMapper = BookMapper()
//            for item in arrayDiskBooks {
//                let dic = item as [String: AnyObject]
//                bookMapper.getBook(<#T##json: [String : AnyObject]##[String : AnyObject]#>, isbn: <#T##String#>)
//            }
//        }
    }
}
