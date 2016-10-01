//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!

    let pizzaManager = PizzaManager.sharedInstance
    var selectedIngredients = Set<PizzaIngredient>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.nextButton.isEnabled = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pizzaManager.getIngredients().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.pizzaManager.getIngredients()[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = item.title
        return cell
    }

    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.pizzaManager.getIngredients()[(indexPath as NSIndexPath).row]
        if self.selectedIngredients.contains(item) {
            self.selectedIngredients.remove(item)
            cell.accessoryType = .none
        } else {
            if self.selectedIngredients.count > 4 {
                return
            }

            self.selectedIngredients.insert(item)
            cell.accessoryType = .checkmark
        }

        self.nextButton.isEnabled = self.selectedIngredients.count > 0 ? true : false

        tableView.reloadRows(at: [indexPath], with: .fade)
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ingredients = Array(self.selectedIngredients)
        self.pizzaManager.setCurrentIngredients(ingredients)
    }
}
