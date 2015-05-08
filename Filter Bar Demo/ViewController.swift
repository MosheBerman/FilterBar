//
//  ViewController.swift
//  Filter Bar Demo
//
//  Created by Moshe Berman on 5/7/15.
//  Copyright (c) 2015 Moshe Berman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filterBar: FilterBar!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        filterBar.addTarget(self, action: "segmentChanged:", forControlEvents: .ValueChanged)
        
        //  This sets the titles of the filter bar.
        filterBar.titles = ["Aragorn", "Bilbo", "Ceorl"]    // Lord of the Rings!
        
        //  This sets the color of the filter bar
        filterBar.color = UIColor.whiteColor()
        
        //
        //  This is some extra styling.
        //
        
        //  Style the navigation controller.
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.13, green: 0.20, blue: 0.62, alpha: 1.00)
        
        //  Set the bakground color of the view.
        self.view.backgroundColor = UIColor(red: 0.13, green: 0.20, blue: 0.62, alpha: 1.00)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

        //
        //  Create the filter
        //
        
        let filter : FilterBar = FilterBar()
        
        //  Add button titles
        filter.titles = ["Albus", "Bathilda", "Charlie", "Harry"]    // Harry Potter!
        
        //  Color the filter bar
        filter.color = UIColor.whiteColor()
        filter.borderColor = UIColor.blackColor()
        
        //  Install the filter
        self.view.addSubview(filter)
        
        //  Add a positioning constraint
        let topConstraint : NSLayoutConstraint = NSLayoutConstraint(item: filter, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 8.0)
        self.view.addConstraint(topConstraint)
        
        // Handle event changes
        filter.addTarget(self, action: "segmentChanged:", forControlEvents: .ValueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segmentChanged(sender: AnyObject) {
        
        let filter : FilterBar = sender as! FilterBar
        
        let index : NSInteger = filter.selectedSegmentIndex
        let string : String = filter.titles[index]
        
        self.displayLabel.text = String(format: "Segment %i : %@", index, string)
        
    }

}

