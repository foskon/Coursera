//
//  SearchList.swift
//  OpenLibrary
//
//  Created by Carlos Manzanas on 09/10/16.
//  Copyright © 2016 foskon. All rights reserved.
//

import UIKit

class SearchList: UITableViewController {
    
    let library = Library.sharedInstance
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = self.library.getSearches().count
        return rows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        let book = self.library.getSearches()[indexPath.row]
        cell?.textLabel?.text = book.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let book = self.library.getSearches()[indexPath.row]
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController? {
            vc.setBook(book)
            self.navigationController?.showViewController(vc, sender: nil)
        }
        
    }
}
