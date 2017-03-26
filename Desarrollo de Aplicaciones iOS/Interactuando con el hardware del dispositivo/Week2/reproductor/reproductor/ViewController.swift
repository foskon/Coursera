//
//  ViewController.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SongsTableDelegate {
    
    let player = PlayerAVFoundation()
    let songsProvider = SongsProvider()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "SongsTable") {
            let view = segue.destination as! SongsTableVC
            view.songs = songsProvider.getSongs()
            view.delegate = self
        }
    }
    
    //
    // SongsTable Delegate
    //
    
    func didSelectSong(song: Song) {
        player.play(song: song)
    }
}
