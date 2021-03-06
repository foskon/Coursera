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
    @IBOutlet weak var infoLabel: UILabel!
    
    var book: Book?
    
    private let library = Library.sharedInstance
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = self.book {
            self.textfield.hidden = true
            self.infoLabel.hidden = true
            self.titleTextarea.text = book.title
            self.author.text = AuthorsRenderer().renderAuthor(book.author)
            self.coveriv.image = CoverRenderer().renderCover(book.cover)
        } else {
            self.textfield.delegate = self
            self.textfield.text = "978-84-667-1693-2"
        }
    }

    func searchISBN(isbn: String) {
        
        self.library.getBook(isbn, success: { (book) in
            self.titleTextarea.text = book.title
            self.author.text = AuthorsRenderer().renderAuthor(book.author)
            self.coveriv.image = CoverRenderer().renderCover(book.cover)
        }) {
            self.showError()
        }
    }

    func showError() {
        let alert = UIAlertController(title: "Error", message: "Error al realizar la petición", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion:nil)
    }
    
    func setBook(book: Book) {
        self.book = book
    }

}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.searchISBN(textField.text!)
        return true
    }

}
