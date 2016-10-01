//
//  MasaWKInterfaceController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 01/10/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import WatchKit
import Foundation


class MasaWKInterfaceController: WKInterfaceController {
    
    let pizzaManager = PizzaManager.sharedInstance
    
    @IBOutlet var tableInterface: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let doughts = self.pizzaManager.getDoughts()
        self.tableInterface.setNumberOfRows(doughts.count, withRowType: "LabelRow")
        
        var i = 0
        for item in doughts {
            let controller = self.tableInterface.rowController(at: i) as! LabelRow
            controller.rowLabel.setText(item.title)
            i += 1
        }
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let dought = self.pizzaManager.getDoughts()[rowIndex]
        self.pizzaManager.setCurrentDought(dought)
        self.pushController(withName: "CheeseInterfaceController", context: nil)
    }

}
