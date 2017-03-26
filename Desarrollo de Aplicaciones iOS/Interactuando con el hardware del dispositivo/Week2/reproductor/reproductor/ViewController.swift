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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let songs = SongsProvider().getSongs()
        player.play(song: songs[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
