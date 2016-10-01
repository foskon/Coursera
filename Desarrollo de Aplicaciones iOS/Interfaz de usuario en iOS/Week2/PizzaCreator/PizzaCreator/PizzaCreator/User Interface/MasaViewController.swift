//
//  MasaViewController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 18/09/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class MasaViewController: BasePickerViewController {
    
    // MARK: UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let doughts = self.pizzaManager.getDoughts()
        return doughts.count
    }
    
    // MARK: UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let dought = self.pizzaManager.getDoughts()[row]
        return dought.title
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedRow = self.picker.selectedRowInComponent(0)
        let selectedDought = self.pizzaManager.getDoughts()[selectedRow]
        self.pizzaManager.setCurrentDought(selectedDought)
    }
}
