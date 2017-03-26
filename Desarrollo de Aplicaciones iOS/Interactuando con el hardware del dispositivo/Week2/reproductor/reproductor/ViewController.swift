//
//  ViewController.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let player = PlayerAVFoundation()
    let songsProvider = SongsProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player.play(song: songsProvider.getSongs()[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
