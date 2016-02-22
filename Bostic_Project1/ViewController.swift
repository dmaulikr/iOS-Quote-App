//
//  ViewController.swift
//  Bostic_Project1
//
//  Created by Sean on 1/24/16.
//  Copyright © 2016 University of Cincinnati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


        //interface builder outlet to the label of the quotes
        @IBOutlet weak var lbl1: UILabel!
    
        //-define the instance of the NSArray type for later use in the viewDidLoad method
        var quotesList : NSArray = NSArray()
        override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //-Load the content of quotesList into array (NSArray)
        //-Get the reference of the folder of the application
        let folderReference = NSBundle.mainBundle()
        
        //-Get the reference of the quotesList file
        let fileReference = folderReference.pathForResource("quotesList", ofType: "plist")
        
        //-Load the contents of quotesList.plist into the quotesList NSArray
        quotesList = NSArray(contentsOfFile: fileReference!)!
            
        // Call the displayQuotes method to display a random quote
        displayQuotes()
        
    }
    
    func displayQuotes(){
        
        // Random number between the array's size
        let arraySize = quotesList.count
        let randomNumber = random() % arraySize
        
        // Use random number to choose the index of the array
        let quote = quotesList.objectAtIndex(randomNumber) as! String
        
        // Assign random quote to the label
        lbl1.text = quote
    }
    
    @IBAction func showNewQuote() {
        displayQuotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

