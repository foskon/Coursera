//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var next: UIBarButtonItem!

    let pizzaManager = PizzaManager.sharedInstance
    var selectedIngredients = Set<PizzaIngredient>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.next.enabled = false
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pizzaManager.getIngredients().count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = self.pizzaManager.getIngredients()[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }

    // MARK: UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let cell = tableview.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = self.pizzaManager.getIngredients()[indexPath.row]
        if self.selectedIngredients.contains(item) {
            self.selectedIngredients.remove(item)
            cell.accessoryType = .None
        } else {
            if self.selectedIngredients.count > 4 {
                return
            }

            self.selectedIngredients.insert(item)
            cell.accessoryType = .Checkmark
        }

        self.next.enabled = self.selectedIngredients.count > 0 ? true : false

        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    // MARK: Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let ingredients = Array(self.selectedIngredients)
        self.pizzaManager.setCurrentIngredients(ingredients)
    }
}
