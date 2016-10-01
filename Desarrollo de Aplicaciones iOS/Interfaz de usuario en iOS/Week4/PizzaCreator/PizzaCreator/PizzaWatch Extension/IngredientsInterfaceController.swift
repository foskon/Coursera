//
//  IngredientsInterfaceController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 01/10/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import WatchKit
import Foundation


class IngredientsInterfaceController: WKInterfaceController, SliderRowDelegate {
    
    let pizzaManager = PizzaManager.sharedInstance
    var ingredientOptions = [PizzaIngredient : Bool]()
    
    @IBOutlet var tableInterface: WKInterfaceTable!
    @IBOutlet var okButton: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        self.okButton.setHidden(true)
        
        let options = self.pizzaManager.getIngredients()
        self.tableInterface.setNumberOfRows(options.count, withRowType: "SliderRow")
        
        var i = 0
        for option in options {
            let controller = self.tableInterface.rowController(at: i) as! SliderRow
            controller.delegate = self
            controller.setIngredient(ingredient: option)
            i += 1
        }
    }
    
    @IBAction func onOkButtonTouch() {
        print(ingredientOptions)
        let ingredients = Array(self.ingredientOptions.keys)
        self.pizzaManager.setCurrentIngredients(ingredients)
        self.pushController(withName: "FinishInterfaceController", context: nil)
    }
    
    func setIngredient(ingredient: PizzaIngredient, added: Bool) {
        ingredientOptions[ingredient] = added
        okButton.setHidden(false)
    }
}
