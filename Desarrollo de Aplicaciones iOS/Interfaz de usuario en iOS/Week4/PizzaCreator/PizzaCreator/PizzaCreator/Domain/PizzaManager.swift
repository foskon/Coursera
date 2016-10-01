//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import Foundation

class PizzaManager {

    fileprivate let sizes: [PizzaSize]
    fileprivate let cheeses: [PizzaCheese]
    fileprivate let doughts: [PizzaDought]
    fileprivate let ingredients: [PizzaIngredient]

    fileprivate var currentSize: PizzaSize?
    fileprivate var currentDought: PizzaDought?
    fileprivate var currentCheese: PizzaCheese?
    fileprivate var currentIngredients: [PizzaIngredient] = []

    static let sharedInstance = PizzaManager()

    
    init() {
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

    func setCurrentSize(_ size: PizzaSize) {
        self.currentSize = size
    }
    
    func getDoughts() -> [PizzaDought] {
        return self.doughts
    }
    
    func setCurrentDought(_ dought: PizzaDought) {
        self.currentDought = dought
    }

    func getCheeses() -> [PizzaCheese] {
        return self.cheeses
    }

    func setCurrentCheese(_ cheese: PizzaCheese) {
        self.currentCheese = cheese
    }

    func getIngredients() -> [PizzaIngredient] {
        return self.ingredients
    }

    func setCurrentIngredients(_ ingredients: [PizzaIngredient]) {
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
