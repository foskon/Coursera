//
// Created by Carlos Manzanas on 29/09/16.
// Copyright (c) 2016 foskon. All rights reserved.
//

import UIKit

class CoverRenderer {

    func renderCover(cover: String) -> UIImage? {
        var image: UIImage?

        if let url = NSURL(string: cover), let data = NSData(contentsOfURL: url) {
            image = UIImage(data: data)
        }

        return image
    }
}
