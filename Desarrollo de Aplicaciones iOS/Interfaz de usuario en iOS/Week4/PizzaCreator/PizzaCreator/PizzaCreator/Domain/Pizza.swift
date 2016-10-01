//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import Foundation

struct Pizza {

    let size: PizzaSize
    let dought: PizzaDought
    let cheese: PizzaCheese
    let ingredients: [PizzaIngredient]

    init(size: PizzaSize, dought: PizzaDought, cheese: PizzaCheese, ingred: [PizzaIngredient]) {
        self.size = size
        self.cheese = cheese
        self.dought = dought
        self.ingredients = ingred
    }
}