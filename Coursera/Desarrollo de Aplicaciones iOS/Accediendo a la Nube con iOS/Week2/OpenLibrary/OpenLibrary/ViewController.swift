//
//  ViewController.swift
//  OpenLibrary
//
//  Created by Carlos Manzanas on 25/09/16.
//  Copyright (c) 2016 foskon. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var titleTextarea: UITextField!
    @IBOutlet weak var author: UITextView!
    @IBOutlet weak var coveriv: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textfield.delegate = self
//        self.textfield.text = "978-84-376-0494-7"
        self.textfield.text = "978-84-667-1693-2"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchISBN(isbn: String) {
        let session = NSURLSession.sharedSession()
        let search = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys={ISBN}"
        let isbnkey = "ISBN:" + isbn
        let searchISBN = search.stringByReplacingOccurrencesOfString("{ISBN}", withString: isbnkey)
        let url = NSURL(string: searchISBN)
        let req = NSURLRequest(URL: url!)
        let task = session.dataTaskWithRequest(req, completionHandler: {
            (data: NSData?, response: NSURLResponse?, error: NSError?) in

            guard
            let mData = data
                else {
                    self.showError()
                    return
            }

            do {
                let json = try NSJSONSerialization.JSONObjectWithData(mData, options: .MutableContainers) as! [String: AnyObject]
                let book = self.getBook(json, isbn: isbnkey)
                dispatch_sync(dispatch_get_main_queue(), {
                    print(book)
                    self.titleTextarea.text = book.title
                    self.author.text = AuthorsRenderer().renderAuthor(book.author)
                    self.coveriv.image = CoverRenderer().renderCover(book.cover)
                })
            } catch {
                self.showError()
            }
        })
        
        task.resume()
    }

    func getBook(json:[String: AnyObject], isbn: String) -> Book {
        print(json)

        var title = ""
        var authors:[String] = []
        var cover = ""

        if let jsonBook = json[isbn] {

            if let jsonAuthors = jsonBook["authors"] as! [[String: AnyObject]]? {
                for jsonItem in jsonAuthors {
                    if let name = jsonItem["name"] as! String? {
                        authors.append(name)
                    }
                }
            }

            if let jsonTitle = jsonBook["title"] as! String? {
                title = jsonTitle
            }

            if let jsonCover = jsonBook["cover"] as! [String: String]? {
                if let jsonCoverUrl = jsonCover["medium"] as String? {
                    cover = jsonCoverUrl
                }
            }
        }

        return Book(title: title, author: authors, cover: cover)
    }

    func showError() {
        let alert = UIAlertController(title: "Error", message: "Error de red", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion:nil)
    }

}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.searchISBN(textField.text!)
        return true
    }

}
