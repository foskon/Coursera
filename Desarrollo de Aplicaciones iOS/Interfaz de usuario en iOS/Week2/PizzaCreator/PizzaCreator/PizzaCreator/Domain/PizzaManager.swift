//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import Foundation


class PizzaManager {

    private let sizes: [PizzaSize]
    private let cheeses: [PizzaCheese]
    private let doughts: [PizzaDought]
    private let ingredients: [PizzaIngredient]

    private var currentSize: PizzaSize?
    private var currentDought: PizzaDought?
    private var currentCheese: PizzaCheese?
    private var currentIngredients: [PizzaIngredient] = []

    static let sharedInstance = PizzaManager()

    
    private init() {
        let small = PizzaSize(title: K.Size.SMALL)
        let medium = PizzaSize(title: K.Size.MEDIUM)
        let big = PizzaSize(title: K.Size.BIG)
        self.sizes = [small, medium, big]

        let cheddar = PizzaCheese(title: K.Cheese.CHEDDAR)
        let mozarella = PizzaCheese(title: K.Cheese.MOZARELLA)
        let parmesano = PizzaCheese(title: K.Cheese.PARMESANO)
        let noCheese = PizzaCheese(title: K.Cheese.NO_CHEESE)
        self.cheeses = [cheddar, mozarella, parmesano, noCheese]

        let crunchy = PizzaDought(title: K.Dought.CRUNCHY)
        let fat = PizzaDought(title: K.Dought.FAT)
        let thin = PizzaDought(title: K.Dought.THIN)
        self.doughts = [crunchy, fat, thin]

        let aceituna = PizzaIngredient(title: K.Ingredient.ACEITUNA)
        let anchoas = PizzaIngredient(title: K.Ingredient.ANCHOAS)
        let carne = PizzaIngredient(title: K.Ingredient.CARNE)
        let jamon = PizzaIngredient(title: K.Ingredient.JAMON)
        let pavo = PizzaIngredient(title: K.Ingredient.PAVO)
        let pina = PizzaIngredient(title: K.Ingredient.PINA)
        let salchicha = PizzaIngredient(title: K.Ingredient.SALCHICHA)
        let salmon = PizzaIngredient(title: K.Ingredient.SALMON)
        self.ingredients = [aceituna, anchoas, carne, jamon, pavo, pina, salchicha, salmon]
    }

    func getSizes() -> [PizzaSize] {
        return self.sizes
    }

    func setCurrentSize(size: PizzaSize) {
        self.currentSize = size
    }
    
    func getDoughts() -> [PizzaDought] {
        return self.doughts
    }
    
    func setCurrentDought(dought: PizzaDought) {
        self.currentDought = dought
    }

    func getCheeses() -> [PizzaCheese] {
        return self.cheeses
    }

    func setCurrentCheese(cheese: PizzaCheese) {
        self.currentCheese = cheese
    }

    func getIngredients() -> [PizzaIngredient] {
        return self.ingredients
    }

    func setCurrentIngredients(ingredients: [PizzaIngredient]) {
        self.currentIngredients = ingredients
    }

    func getPizza() -> Pizza {
        let pizza = Pizza(
                size: self.currentSize!,
                dought: self.currentDought!,
                cheese: self.currentCheese!,
                ingred: self.currentIngredients)

        return pizza
    }
}
