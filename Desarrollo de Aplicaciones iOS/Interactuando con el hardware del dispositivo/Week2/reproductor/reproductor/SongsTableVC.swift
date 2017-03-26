//
//  SongsTableVC.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import UIKit

class SongsTableVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    let songs = SongsProvider().getSongs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(SongCell.self, forCellReuseIdentifier: SongCell.identifier)
    }
    
    
    // UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = song.getTitle()
        
        return cell
    }
}
