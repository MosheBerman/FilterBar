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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segmentChanged(sender: AnyObject) {
        
        let filter : FilterBar = sender as! FilterBar
        
        self.displayLabel.text = String(format: "Segment: %i", self.filterBar.selectedSegmentIndex)
        
    }

}

