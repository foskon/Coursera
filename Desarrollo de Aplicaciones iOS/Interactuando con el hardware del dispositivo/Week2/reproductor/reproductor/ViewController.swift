//
//  ViewController.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SongsTableDelegate {
    
    var player: PlayerClient!
    var songsTable: SongsTableVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = PlayerClient(songs: getSongs())
    }
    
    @IBAction func didTouchShuffle() {
        player.shuffle()
        songsTable.selectIndex(index: player.currentIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "SongsTable") {
            let view = segue.destination as! SongsTableVC
            songsTable = view
            songsTable.delegate = self
        }
    }
    
    fileprivate func getSongs() -> [Song] {
        let provider = SongsProvider()
        return provider.getSongs()
    }
    
    //
    // SongsTable Delegate
    //
    
    func didSelect(songId: String) {
        player.play(songId: songId)
    }
    
    func numberOfSongs() -> Int {
        return player.songs.count
    }
    
    func songForRow(row: Int) -> Song {
        return player.songs[row]
    }
}
