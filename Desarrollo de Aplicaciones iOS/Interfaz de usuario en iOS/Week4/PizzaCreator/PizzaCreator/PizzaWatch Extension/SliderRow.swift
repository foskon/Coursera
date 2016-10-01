//
//  SliderRow.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 01/10/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import WatchKit

protocol SliderRowDelegate {
    
    func setIngredient(ingredient: PizzaIngredient, added:Bool)
}

class SliderRow: NSObject {
    
    var delegate: SliderRowDelegate?
    var ingredient:PizzaIngredient?
    
    @IBOutlet weak var rowSwitch: WKInterfaceSwitch!
    
    func setIngredient(ingredient: PizzaIngredient) {
        self.ingredient = ingredient
        self.rowSwitch.setTitle(ingredient.title)
        self.rowSwitch.setOn(false)
    }

    @IBAction func onSliderChange(_ value: Bool) {
        guard
            let delegate = self.delegate,
            let ingredient = self.ingredient
            else {
                return
        }
            
        delegate.setIngredient(ingredient: ingredient, added: value)
    }
}
