//
//  SongPlayingVC.swift
//  reproductor
//
//  Created by Carlos Manzanas on 26/03/17.
//  Copyright © 2017 foskon. All rights reserved.
//

import UIKit

class SongPlayingVC: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = ""
    }
    
    func setSong(song: Song) {
        self.label.text = song.getTitle()
        do {
            let data = try Data(contentsOf: song.getThumbUrl())
            image.image = UIImage(data: data)
        } catch {
            
        }
    }
    
    func clear() {
        self.label.text = ""
        self.image.image = nil
    }
}
