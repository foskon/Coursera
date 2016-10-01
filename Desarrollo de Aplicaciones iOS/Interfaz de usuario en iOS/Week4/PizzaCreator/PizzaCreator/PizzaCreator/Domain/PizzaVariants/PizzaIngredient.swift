//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import Foundation

struct PizzaIngredient: Equatable {
    let title: String

    init(title: String) {
        self.title = title
    }
}

extension PizzaIngredient: Hashable {
    
    var hashValue: Int {
        return self.title.hashValue
    }
}

func ==(lhs: PizzaIngredient, rhs: PizzaIngredient) -> Bool {
    return lhs.title == rhs.title
}