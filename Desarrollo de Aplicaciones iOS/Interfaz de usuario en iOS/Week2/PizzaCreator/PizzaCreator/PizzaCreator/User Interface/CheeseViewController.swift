//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class CheeseViewController: BasePickerViewController {

    // MARK: UIPickerViewDataSource

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let items = self.pizzaManager.getCheeses()
        return items.count
    }

    // MARK: UIPickerViewDelegate

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = self.pizzaManager.getCheeses()[row]
        return item.title
    }

    // MARK: Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedRow = self.picker.selectedRowInComponent(0)
        let selectedItem = self.pizzaManager.getCheeses()[selectedRow]
        self.pizzaManager.setCurrentCheese(selectedItem)
    }
}
