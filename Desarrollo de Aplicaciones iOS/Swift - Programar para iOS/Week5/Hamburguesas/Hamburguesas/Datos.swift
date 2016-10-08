//
//  Datos.swift
//  Hamburguesas
//
//  Created by Carlos Manzanas on 08/10/16.
//  Copyright © 2016 foskon. All rights reserved.
//

import Foundation

class ColeccionDePaises {
    let paises = [
        "Afganistán",
        "Albania",
        "Alemania",
        "Anguila",
        "Bangladés",
        "Benín",
        "China",
        "Etiopía",
        "Guam",
        "Israel",
        "Lituania",
        "Marruecos",
        "Nauru",
        "Nepal",
        "España",
        "Italia",
        "Palaos",
        "Rusia",
        "Reino Unido",
        "Santa Lucía",
        "Senegal",
        "Servia"
    ]
    
    func obtenPais() -> String {
        let i = Int(arc4random()) % paises.count
        
        if (i < paises.count) {
            return paises[i]
        }
        
        return ""
    }
}

class ColeccionDeHamburguesa {
    let hamburguesas = [
        "Con Queso",
        "Vegetal",
        "Sin Queso",
        "Con extra de queso",
        "Con huevo",
        "Sin nada",
        "De Tofu",
        "Con Bacon",
        "Con Cebolla",
        "Sin Cebolla",
        "Con Aceitunas",
        "Con Chile",
        "Sin Pan",
        "Con Pan de Mollete",
        "Con Mostaza",
        "De Pollo",
        "De Buey",
        "Con Manzana",
        "Sin Salsas",
        "Doble",
        "Triple",
        "Cuádruple"
    ]
    
    func obtenHamburguesa() -> String {
        let i = Int(arc4random()) % hamburguesas.count
        
        if (i < hamburguesas.count) {
            return hamburguesas[i]
        }
        
        return ""
    }
}




