//
//  SongsTableVC.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import UIKit

protocol SongsTableDelegate {
    
    func didSelectSong(song: Song)
}

class SongsTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var delegate: SongsTableDelegate!
    var songs: [Song]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(SongCell.self, forCellReuseIdentifier: SongCell.identifier)
    }
    
    //
    // UITableView DataSource
    //
    func numberOfSections(in tableView: UITableView) -> Int {
        return songs != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = song.getTitle()
        
        return cell
    }
    
    //
    // UITableView Delegate
    //
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectSong(song: songs[indexPath.row])
    }
}
