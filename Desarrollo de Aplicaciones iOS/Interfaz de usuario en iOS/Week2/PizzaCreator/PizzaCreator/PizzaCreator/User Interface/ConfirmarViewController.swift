//
// Created by Carlos Manzanas on 18/09/16.
// Copyright (c) 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class ConfirmarViewController: UIViewController {

    @IBOutlet weak var tamanio: UILabel!
    @IBOutlet weak var masa: UILabel!
    @IBOutlet weak var queso: UILabel!
    @IBOutlet weak var ingredientes: UILabel!

    let pizzaManager = PizzaManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        let pizza = self.pizzaManager.getPizza()
        self.tamanio.text = "Tamaño " + pizza.size.title
        self.masa.text = "Masa " + pizza.dought.title
        self.queso.text = "Queso " + pizza.cheese.title

        var ing = "Ingredientes:"
        for ingre in pizza.ingredients {
            ing += "\n" + ingre.title
        }
        self.ingredientes.text = ing
    }

    @IBAction func onSendTouch(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CookingViewController")
        self.presentViewController(vc, animated: true) { 
            self.navigationController?.popToRootViewControllerAnimated(false)
        }
    }
}
