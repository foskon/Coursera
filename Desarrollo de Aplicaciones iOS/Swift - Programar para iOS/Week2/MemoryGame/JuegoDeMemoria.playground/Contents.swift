//: Playground - noun: a place where people can play

import UIKit

for rango in 0...100 {
    // mod 5
    if rango % 5 == 0 {
        print ("# \(rango) Bingo!!!")
    }
    
    // par/impar
    if rango % 2 == 0 {
        print ("# \(rango) Par!!!")
    } else {
        print ("# \(rango) Impar!!!")
    }
    
    // del 30 al 40
    if rango > 30 && rango < 40 {
        print ("# \(rango) Viva Swift!!!")
    }
}