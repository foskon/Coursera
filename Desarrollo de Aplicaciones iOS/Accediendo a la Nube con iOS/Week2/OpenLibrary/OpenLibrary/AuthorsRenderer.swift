//
// Created by Carlos Manzanas on 29/09/16.
// Copyright (c) 2016 foskon. All rights reserved.
//

import Foundation

class AuthorsRenderer {
    func renderAuthor(author: [String]) -> String {
        var text = ""

        for item in author {
            text += item + "\n"
        }

        return text
    }
}
