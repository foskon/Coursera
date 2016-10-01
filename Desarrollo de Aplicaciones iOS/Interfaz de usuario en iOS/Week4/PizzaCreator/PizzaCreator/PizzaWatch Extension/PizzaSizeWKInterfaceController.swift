//
//  PizzaSizeWKInterfaceController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 01/10/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import WatchKit
import Foundation


class PizzaSizeWKInterfaceController: WKInterfaceController {
    
    let pizzaManager = PizzaManager.sharedInstance

    @IBOutlet var tableInterface: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let sizes = self.pizzaManager.getSizes()
        self.tableInterface.setNumberOfRows(sizes.count, withRowType: "LabelRow")
        
        var i = 0
        for size in sizes {
            let controller = self.tableInterface.rowController(at: i) as! LabelRow
            controller.rowLabel.setText(size.title)
            i += 1
        }
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let size = self.pizzaManager.getSizes()[rowIndex]
        self.pizzaManager.setCurrentSize(size)
        self.pushController(withName: "MasaWKInterfaceController", context: nil)
    }
}
