//
//  BasePickerViewController.swift
//  PizzaCreator
//
//  Created by Carlos Manzanas on 18/09/16.
//  Copyright © 2016 Carlos Manzanas. All rights reserved.
//

import UIKit

class BasePickerViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    
    let pizzaManager = PizzaManager.sharedInstance
    
}
