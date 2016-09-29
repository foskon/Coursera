//
// Created by Carlos Manzanas on 29/09/16.
// Copyright (c) 2016 foskon. All rights reserved.
//

import Foundation

class Book {
    let title: String
    let author: [String]
    let cover: String

    init(title: String, author: [String], cover: String) {
        self.title = title
        self.author = author
        self.cover = cover
    }
}
