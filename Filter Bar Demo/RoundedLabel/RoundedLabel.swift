//
//  RoundedLabel.swift
//  Filter Bar Demo
//
//  Created by Moshe Berman on 5/7/15.
//  Copyright (c) 2015 Moshe Berman. All rights reserved.
//

import UIKit

@IBDesignable class RoundedLabel: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = min(self.bounds.height, self.bounds.width) / 2.0
        self.clipsToBounds = true
    }
    
}
