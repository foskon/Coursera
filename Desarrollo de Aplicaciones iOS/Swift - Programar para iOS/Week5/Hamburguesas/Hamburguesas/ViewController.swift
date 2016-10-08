//
//  ViewController.swift
//  Hamburguesas
//
//  Created by Carlos Manzanas on 08/10/16.
//  Copyright © 2016 foskon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelPais: UILabel!
    @IBOutlet weak var labelHamburguesa: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    let hambur = ColeccionDeHamburguesa()
    let paises = ColeccionDePaises()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.randomize()
    }

    @IBAction func onButtonTouch() {
        self.randomize()
    }
    
    func randomize() {
        let pais = self.paises.obtenPais()
        self.labelPais.text = pais
        
        let hambur = self.hambur.obtenHamburguesa()
        self.labelHamburguesa.text = hambur
        
        let r = ( CGFloat(arc4random() % 256) / 256.0 )
        let g = ( CGFloat(arc4random() % 256) / 256.0 )
        let b = ( CGFloat(arc4random() % 256) / 256.0 )
        
        self.mainView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

