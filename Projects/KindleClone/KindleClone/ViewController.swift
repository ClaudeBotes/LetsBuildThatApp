//
//  ViewController.swift
//  KindleClone
//
//  Created by Claude on 4/5/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class Book{
    let title: String
    let author: String
    let pages: [Page]
    
    init(title: String, author: String, pages: [Page]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}

class Page {
    let pageNumber: Int
    let text: String
    
    init(pageNumber: Int, text: String) {
        self.pageNumber = pageNumber
        self.text = text
    }
}

class ViewController: UIViewController {

    // MARK: Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Pages
        
        let pageOne = Page(pageNumber: 1, text: "This is page one with some text.")
        let pageTwo = Page(pageNumber: 2, text: "This is page two with some other text.")
        let pages = [pageOne, pageTwo]
        
        // Create Books
        
        // Create Book 1
        
        let bookOne = Book(title: "Steve Jobs", author: "Walter Issacson", pages: pages)
        
        // Create Book 2
        
        let bookTwo = Book(title: "Elon Musk Bio",
                           author: "Kevin Flynn",
                           pages: [
                            Page(pageNumber: 1, text: "Text for Elon page 1"),
                            Page(pageNumber: 2, text: "Text for Elon page 2"),
                            Page(pageNumber: 3, text: "Text for Elon page 3"),
                            Page(pageNumber: 4, text: "Text for Elon page 4")])
        
        // Print Book Pages
        
        for book in [bookOne, bookTwo]{
            
            print("Book Title: \(book.title)")
            
            for page in book.pages{
                print("Page Number: \(page.pageNumber )")
                print("Page Text: \(page.text )")
            }
            print("Loading next book...")
        }
        
        
        
        
    }
}

