//
//  ViewController.swift
//  Filter Bar Demo
//
//  Created by Moshe Berman on 5/7/15.
//  Copyright (c) 2016 Moshe Berman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var filterBar: FilterBar!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        //  Define a blue.
        //
        
        let blue : UIColor = UIColor(red: 0.13, green: 0.20, blue: 0.62, alpha: 1.00)
        
        //
        //  Wire up the filter bar that was create in Interface Builder
        //
        
        filterBar.addTarget(self, action: #selector(ViewController.segmentChanged(_:)), forControlEvents: .ValueChanged)
        
        //  This sets the titles of the filter bar.
        filterBar.titles = ["Aragorn", "Bilbo", "Ceorl"]    // Lord of the Rings!

        
        //
        //  This is some extra styling.
        //
        
        //  Style the navigation controller.
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        
        //  Set the bakground color of the view.
        self.view.backgroundColor = blue
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

        //
        //  Create the filter
        //
        
        let filter : FilterBar = FilterBar()
        
        //  Add button titles
        filter.titles = ["Albus", "Bathilda", "Charlie", "Harry"]    // Harry Potter!
        
        //  Color the text
        filter.tintColor = UIColor.whiteColor()
        
        //  Tint the filter bar
        filter.barTintColor = blue
        
        //  Enable translucency
        filter.translucent = true
        
        //  Install the filter
        self.view.addSubview(filter)
        
        //  Add a positioning constraint
        let topConstraint : NSLayoutConstraint = NSLayoutConstraint(item: filter, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 8.0)
        self.view.addConstraint(topConstraint)
        
        // Handle event changes
        filter.addTarget(self, action: #selector(ViewController.segmentChanged(_:)), forControlEvents: .ValueChanged)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let bar : UINavigationBar = (self.navigationController?.navigationBar)!
        
        self.searchHierarchyForBorder(bar)
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

    func searchHierarchyForBorder(rootView:UIView) {
        
        if rootView.layer.borderWidth > 0.0 {
            NSLog("Found border on view: %@, %@", rootView, rootView.self)
        }
        
        let subviews : Array<UIView> = rootView.subviews 
        
        for view : UIView in subviews {
            searchHierarchyForBorder(view)
        }
    }
    
}

