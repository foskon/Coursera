//
//  FinishInterfaceController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 02/10/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import WatchKit
import Foundation


class FinishInterfaceController: WKInterfaceController {

    let pizzaManager = PizzaManager.sharedInstance
    
    @IBOutlet var tableInterface: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let pizza = self.pizzaManager.getPizza()
        
        var options = [String]()
        options.append("TAMAÑO")
        options.append(pizza.size.title)
        options.append("TIPO")
        options.append(pizza.dought.title)
        options.append("QUESO")
        options.append(pizza.cheese.title)
        
        options.append("INGREDIENTES")
        for ing in pizza.ingredients {
            options.append(ing.title)
        }
        
        self.tableInterface.setNumberOfRows(options.count, withRowType: "LabelRow")
        
        var i = 0
        for option in options {
            let controller = self.tableInterface.rowController(at: i) as! LabelRow
            controller.rowLabel.setText(option)
            i += 1
        }
        
    }
}
