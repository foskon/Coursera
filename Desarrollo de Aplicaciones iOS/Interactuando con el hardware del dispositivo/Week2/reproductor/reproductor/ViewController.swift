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
    var songPlaying: SongPlayingVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = PlayerClient(songs: getSongs())
    }
    
    @IBAction func didTouchShuffle() {
        player.shuffle()
        
        let index = player.currentIndex
        songsTable.selectIndex(index: index)
        let song = player.songs[index]
        songPlaying.setSong(song: song)
    }
    
    @IBAction func didTouchPlay() {
        player.play()
    }
    
    @IBAction func didTouchStop() {
        player.stop()
    }
    
    @IBAction func didTouchPause() {
        player.pause()
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        player.setVolume(value: sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "SongsTable") {
            let view = segue.destination as! SongsTableVC
            songsTable = view
            songsTable.delegate = self
        }
        if (segue.identifier == "SongPlayingVC") {
            let view = segue.destination as! SongPlayingVC
            songPlaying = view
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
        let song = player.songs[player.currentIndex]
        songPlaying.setSong(song: song)
    }
    
    func numberOfSongs() -> Int {
        return player.songs.count
    }
    
    func songForRow(row: Int) -> Song {
        return player.songs[row]
    }
}
