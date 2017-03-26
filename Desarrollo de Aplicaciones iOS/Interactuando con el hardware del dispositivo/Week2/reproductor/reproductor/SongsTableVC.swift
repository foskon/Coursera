//
//  SongsTableVC.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import UIKit

protocol SongsTableDelegate {
    
    func numberOfSongs() -> Int
    func songForRow(row: Int) -> Song
    func didSelect(songId: String)
}


class SongsTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    var delegate: SongsTableDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(SongCell.self, forCellReuseIdentifier: SongCell.identifier)
    }
    
    func selectIndex(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        table.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
    }
    
    //
    // UITableView DataSource
    //
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.numberOfSongs()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = delegate.songForRow(row: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SongCell
        
        cell.textLabel?.text = song.getTitle()
        cell.songId = song.getId()
        
        return cell
    }
    
    //
    // UITableView Delegate
    //
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songCell = tableView.cellForRow(at: indexPath) as! SongCell
        delegate.didSelect(songId: songCell.songId)
    }
}
