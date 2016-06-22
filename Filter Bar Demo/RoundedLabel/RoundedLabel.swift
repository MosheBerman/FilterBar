//
//  RoundedLabel.swift
//  Filter Bar Demo
//
//  Created by Moshe Berman on 5/7/15.
//  Copyright (c) 2016 Moshe Berman. All rights reserved.
//

import UIKit

@IBDesignable class RoundedLabel: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = min(CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds)) / 2.0
        self.clipsToBounds = true
    }
    
}
