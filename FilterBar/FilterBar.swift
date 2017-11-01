//
//  KSRFilterBar.swift
//  Filter Bar Demo
//
//  Created by Moshe Berman on 5/7/15.
//  Copyright (c) 2015 Moshe. All rights reserved.
//

import UIKit

@IBDesignable public class FilterBar : UIControl {
    
    //  MARK: - Segments
    
    @IBInspectable public var selectedSegmentIndex : NSInteger = 0 {
        
        didSet {
            
            //
            //  Ensure that we can't go out of bounds
            //
            
            if selectedSegmentIndex >= self.titles.count {
                selectedSegmentIndex = self.titles.count - 1
            }
            
            if selectedSegmentIndex < 0 {
                selectedSegmentIndex = 0
            }
            
            self.sendActions(for: .valueChanged)
        }
    }
    
    //  Buttons
    
    public var buttons : Array<UIButton> = Array()
    
    //  Titles
    
    public var titles : Array<String> = [] {
        didSet {
            self.layoutButtons()
        }
    }
    
    //
    //  MARK: - Appearance
    //
    
    //  Fonts 
    
    public let buttonFont : UIFont? = UIFont.systemFont(ofSize: 14.0)
    public let buttonSelectedFont : UIFont? = UIFont.boldSystemFont(ofSize: 16.0)
    
    //  Tint Color
    
    @IBInspectable override dynamic public var tintColor : UIColor! {
        didSet {
            applyColor()
        }
    }
    
    //  Bar Color
    
    @IBInspectable dynamic public var barTintColor : UIColor = UIColor.white {
        didSet {
            applyColor()
        }
    }
    
    //  Translucency
    
    @IBInspectable dynamic public var translucent : Bool = true {
        didSet {
            applyColor()
        }
    }

    //
    //  MARK: - Internal Overlays
    //
    
    fileprivate let _colorOverlay : UIView = UIView()
    fileprivate let _whiteOverlay : UIView = UIView()
    
    //
    //  MARK: - Initializers
    //
    
    public init() {
        super.init(frame: CGRect.zero)
        
        self.initializeDefaults()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initializeDefaults()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.initializeDefaults()
    }
    
    //
    //  MARK: - Initialize Defaults
    //
    
    private func initializeDefaults() {
        self.titles = ["Segment A", "Segment B", "Segment C"]
        self.tintColor = UIColor.black
        self.barTintColor = UIColor.white
        self.translucent = true
        
        
        //  Border colors
        let space : CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let color : CGColor = CGColor(colorSpace: space, components: [0.0, 0.0, 0.0, 0.3])!
        
        self.layer.borderColor = color
        self.layer.borderWidth = 0.5
    }
    
    //
    //  MARK: - View Lifecycle
    //
    
    //
    //  Before moving to the superview, we want a few things
    //  to happen.
    //
    //  1. Turn off autoresizing masks.
    //  2. Apply the color settings.
    //
    
    override public func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        #if !TARGET_INTERFACE_BUILDER
        self.translatesAutoresizingMaskIntoConstraints = false
        self._colorOverlay.translatesAutoresizingMaskIntoConstraints = false
        #endif
        
        self.applyColor()
    }
    
    //
    //  After we've moved to the superview,
    //  we need to position the FilterBar in
    //  the superview.
    //
    
    override public func didMoveToSuperview() {
        
        super.didMoveToSuperview()
        
        //
        //  Ensure we're snapped to the edges of the superview
        //
        
        if let superview = self.superview
        {
            
            let centerX : NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0);
            let width : NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: 2.0) // 2 Points wider than the parent
            
            superview.addConstraints([centerX, width])
        }
        else
        {
            NSLog("Failed to find a superview. Weird.")
        }
        
        //
        //  Lay out the buttons
        //
        
        self.setNeedsLayout()
    }
    
    //
    //  MARK: - Layout
    //
    
    override public func layoutSubviews() {
        
        //
        //  Install a white overlay
        //
        
        let containsWhiteView : Bool = (self.subviews ).contains(self._whiteOverlay)
        
        if !containsWhiteView {
            if self.translucent {
                self.layoutWhiteOverlayView()
            }
            else {
                self.removeConstraints(_whiteOverlay.constraints)
                _whiteOverlay.removeFromSuperview()
            }
        }
        
        //
        //  Add the color view
        //
        
        let containsColorView : Bool = (self.subviews).contains(self._colorOverlay)
        
        if !containsColorView {
            if self.translucent {
                self.layoutColorOverlayView()
            }
            else {
                self.removeConstraints(_colorOverlay.constraints)
                _colorOverlay.removeFromSuperview()
            }
        }
        
        //
        //  Layout the buttons
        //
        
        self.layoutButtons()
    }
    
    //
    //  Install the color overlay view into the view hierarchy
    //  and lay it out using autolayout.
    //
    
    func layoutColorOverlayView() {
        
        self.addSubview(self._colorOverlay)
        #if !TARGET_INTERFACE_BUILDER
        self._colorOverlay.translatesAutoresizingMaskIntoConstraints = false
        #endif
        
        let x : NSLayoutConstraint = NSLayoutConstraint(item: self._colorOverlay, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let y : NSLayoutConstraint = NSLayoutConstraint(item: self._colorOverlay, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        let h : NSLayoutConstraint = NSLayoutConstraint(item: self._colorOverlay, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: -1.0)
        let w : NSLayoutConstraint = NSLayoutConstraint(item: self._colorOverlay, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0)
        
        self.addConstraints([x, y, h, w])
        
    }
    
    //
    //  Install the white overlay view into the view hierarchy
    //  and lay it out using autolayout.
    //
    
    func layoutWhiteOverlayView() {
        
        self.addSubview(self._whiteOverlay)
        
        self._whiteOverlay.translatesAutoresizingMaskIntoConstraints = false
        
        let x : NSLayoutConstraint = NSLayoutConstraint(item: self._whiteOverlay, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let y : NSLayoutConstraint = NSLayoutConstraint(item: self._whiteOverlay, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        let h : NSLayoutConstraint = NSLayoutConstraint(item: self._whiteOverlay, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: -1.0)
        let w : NSLayoutConstraint = NSLayoutConstraint(item: self._whiteOverlay, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0)
        
        self.addConstraints([x, y, h, w])
        
    }
    
    //
    //  This function handles the layout of the buttons
    //
    
    func layoutButtons() {
        
        if self.superview == nil {
            return
        }
        
        //  Clean up the old buttons
        
        self.buttons.forEach { $0.removeFromSuperview() }
        self.buttons.removeAll(keepingCapacity: false)
        
        //  If there are titles, create buttons and display them.
        
        for title in self.titles {
            
            //  Cast the title...
            let buttonTitle : String = title as String
            
            //  Create a button
            let button : UIButton = UIButton(type: .custom)
            
            //  Set the button title & colors
            button.setTitle(buttonTitle, for: UIControlState())
            button.setTitleColor(self.tintColor, for: UIControlState())
            button.backgroundColor = UIColor.clear
            button.titleLabel?.font = self.buttonFont
            
            //  Wire up the button to an action
            button.addTarget(self, action: #selector(FilterBar.buttonWasTapped(_:)), for: .touchUpInside)
            
            //  Prepare the button for constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            
            //  Grab the previous button to anchor the new button against.
            var leftItem : AnyObject? = self.buttons.last;
            var attribute : NSLayoutAttribute = .right
            
            if leftItem == nil {
                leftItem = self
                attribute = .left
            }
            
            //  Create constraints
            let x : NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: leftItem, attribute: attribute, multiplier: 1.0, constant: 0)
            let y : NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
            let h : NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0)
            let w : NSLayoutConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.buttonWidth())
            
            //  Now add the button to the array and view hierarchy.
            self.buttons.append(button)
            self.addSubview(button)
            
            //  Install the constraints
            self.addConstraints([h, w, x, y])
        }
        
        
        //  Style the appropriate button.
        
        let newButton : UIButton = self.buttons[self.selectedSegmentIndex]
        
        newButton.titleLabel?.font = self.buttonSelectedFont
    }
    
    //
    //  MARK: - Autolayout Support
    //
    
    //
    //  This method returns the intrinsic content size.
    //
    //  A FilterBar is always 44 points tall and stretches
    //  just beyond either side of its superview.
    //
    
    override public var intrinsicContentSize : CGSize {
        
        var intrinsicWidth : CGFloat = UIViewNoIntrinsicMetric
        
        if let width : CGFloat = self.superview?.bounds.width {
            intrinsicWidth = width + 2.0
        }
        
        return CGSize(width: intrinsicWidth, height: 44.0)
    }
    
    //
    //  This method ensures that the FilterBar is always used with autolayout.
    //
    
    override public class var requiresConstraintBasedLayout : Bool  {
        return true
    }
    
    //
    //  MARK: - Handling Segment Taps
    //
    
    //
    //  This function changes the selected segment
    //  index and updates the buttons.
    //
    
    @objc func buttonWasTapped(_ button:UIButton) {
        
        
        //  Set the index - this will cause the .ValueChanged to fire.
        self.selectedSegmentIndex = self.indexForButton(button)
        
        for b : UIButton in self.buttons {
            if b.isEqual(button) {
                b.titleLabel?.font = self.buttonSelectedFont
            }
            else
            {
                b.titleLabel?.font = self.buttonFont
            }
        }
    }
    
    //
    //  MARK: - Helpers
    //
    
    //
    //  Find the index of the button that was tapped.
    //
    //  :param: title The button that we want to convert into an index.
    //
    //  :returns: An integer representing the index.
    //
    
    func indexForButton(_ button: UIButton) -> NSInteger {
        
        var index : NSInteger = -1
        
        for i in 0...self.titles.count {
            if button.isEqual(self.buttons[i]) {
                index = i
                break
            }
        }
        
        return index
    }
    
    
    //
    //  Calculate the appropriate width for the buttons.
    //
    //  :return: A CGFloat that's the width of a button.
    //
    
    func buttonWidth() -> CGFloat {
        
        var width = self.bounds.width / CGFloat(self.titles.count)
        
        if self.titles.count == 0 {
            width = self.bounds.width
        }
        
        return width
    }
    
    //
    //  Returns the constraint matching the identifier.
    //
    //  :param: identifier The identifier to search for.
    //
    //  :return; The first layout constraint whose identifier is equal to the supplied identifier.
    //
    
    func layoutConstraintWithIdentifier(_ identifier: String) -> NSLayoutConstraint? {
        
        var constraint : NSLayoutConstraint? = nil
        
        let constraints : Array = self.constraints as Array
        
        for c in constraints {
            if c.identifier == identifier {
                constraint = c
            }
        }
        
        return constraint
    }
    
    //
    //  This method applies the tint and barTint colors.
    //
    //  The button colors are applied when we generate the buttons.
    //
    
    func applyColor() {
        
        //  If the bar is solid, apply the background color and cler the colorOverlay.
        if self.translucent == false {
            
            self._colorOverlay.backgroundColor = UIColor.clear
            self._whiteOverlay.backgroundColor = UIColor.clear
            
            self.backgroundColor = self.barTintColor
            self.isOpaque = true
        }
            
            //  Else, appropriately tint the color and white overlays and make the background clear.
        else {
            self._colorOverlay.alpha = 0.85
            self._colorOverlay.backgroundColor = self.barTintColor
            self._colorOverlay.isOpaque = false
            
            self._whiteOverlay.backgroundColor = UIColor(white: 0.97, alpha: 0.5)
            self._whiteOverlay.isOpaque = false
            
            self.isOpaque = false
            self.backgroundColor = UIColor.clear
        }
        
    }
}
