//
//  CheeseInterfaceController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 01/10/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import WatchKit
import Foundation


class CheeseInterfaceController: WKInterfaceController {

    let pizzaManager = PizzaManager.sharedInstance
    
    @IBOutlet var tableInterface: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let options = self.pizzaManager.getCheeses()
        self.tableInterface.setNumberOfRows(options.count, withRowType: "LabelRow")
        
        var i = 0
        for option in options {
            let controller = self.tableInterface.rowController(at: i) as! LabelRow
            controller.rowLabel.setText(option.title)
            i += 1
        }
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let item = self.pizzaManager.getCheeses()[rowIndex]
        self.pizzaManager.setCurrentCheese(item)
        self.pushController(withName: "IngredientsInterfaceController", context: nil)
    }
    
}
