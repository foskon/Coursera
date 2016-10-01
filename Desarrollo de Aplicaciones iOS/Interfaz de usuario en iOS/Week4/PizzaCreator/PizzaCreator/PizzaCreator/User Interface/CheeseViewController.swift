//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class CheeseViewController: BasePickerViewController {

    // MARK: UIPickerViewDataSource

    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let items = self.pizzaManager.getCheeses()
        return items.count
    }

    // MARK: UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = self.pizzaManager.getCheeses()[row]
        return item.title
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedRow = self.picker.selectedRow(inComponent: 0)
        let selectedItem = self.pizzaManager.getCheeses()[selectedRow]
        self.pizzaManager.setCurrentCheese(selectedItem)
    }
}
