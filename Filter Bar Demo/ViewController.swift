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
        filterBar.titles = ["Apples", "Bananas", "Cherries"]
        
        //  This sets the color of the filter bar
        filterBar.color = UIColor.whiteColor()
        
        //
        //  This is some extra styling.
        //
        
        //  Style the navigation controller.
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.13, green: 0.20, blue: 0.62, alpha: 1.00)
        
        //  Set the bakground color of the view.
        self.view.backgroundColor = UIColor(red: 0.13, green: 0.20, blue: 0.62, alpha: 1.00)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segmentChanged(sender: AnyObject) {
        
        let filter : FilterBar = sender as! FilterBar
        
        let index : NSInteger = self.filterBar.selectedSegmentIndex
        let string : String = filter.titles[index]
        
        self.displayLabel.text = String(format: "Segment %i : %@", index, string)
        
    }

}

