![Promo](https://github.com/MosheBerman/FilterBar/raw/master/Promo.png)

# FilterBar

FilterBar is a fancy implementation of UISegmentedControl that is designed to look good under navigation bars, search controllers, and really anywhere else in your app. 

It's designed to stretch across its superview and handle segment layout nicely.

Getting Started:
---
Add `FilterBar.swift` to your project. 

Or, with CocoaPods:

    pod 'FilterBar' -> '1.0.5'

Creating a FilterBar:
---
It's simple: 

        let filter : FilterBar = FilterBar()
        
That's it. We'll use our `filter` for the remainder of this README.

Setting the Segment Titles:
---
To choose what titles are shown on the filter bar, set the `titles` property of the filter bar. FilterBar will then trigger a layout update and automatically generate the segments. For example: 

    filter.titles = ["Albus", "Bathilda", "Charlie", "Harry"]    // Harry Potter!
    
Positioning the FilterBar:
---
FilterBar uses an intrinsic size and a pair of layout constraints to ensure that it it always centered in and stretched across its superview. You only need to provide a Y position constraint for it.


        //  Create a constraint that attaches the filter bar to the top layout guide.
        let topConstraint : NSLayoutConstraint = NSLayoutConstraint(item: filter, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 8.0)
        
        //	Add the constraint to the filter view.
        self.view.addConstraint(topConstraint)
        
Every FilterBar issued from the factory calls `setTranslatesAutoresizingMaskIntoConstraints` on itself so you don't have to.

Coloring the FilterBar:
--- 
FilterBar contains two properties for controlling appearance. The `color` property sets the text color and the background color. 

        //  Color the filter bar
        filter.color = UIColor.whiteColor()
        
This will cause the filter bar to have a white. Personally, I think a black or white color works well for most cases, because the background color will bleed through. FilterBar applies the color with an opacity of 0.1 as the `backgroundColor`.
        
        //	The border is going to be black.
        filter.borderColor = UIColor.blackColor()

The FilterBar `borderColor` is set to 0.5 opacity before being applied, to approximate how translucent navigation bars shade themselves. 

Getting Events:
---
FilterBar is a subclass of `UIControl`, and uses the `.ValueChanged` event to handle changes.

    filter.addTarget(self, action: "segmentChanged:", forControlEvents: .ValueChanged)

This assumes that you have a handler called `segmentChanged:` that looks something like this:

    func segmentChanged(sender: AnyObject) {
    	//	Handle changes here
    }

Checking which Segment is Selected:
---
Use the `selectedSegmentIndex` property.

Interface Builder Support:
---
FilterBar supports Interface Builder in several ways. You can set the color of the bar, and FilterBar will render a preview in interface builder.

![IB](https://github.com/MosheBerman/FilterBar/raw/master/InterfaceBuilder.png)

To use FilterBar with Interface Builder, drag a UIView out on to your view (controller) and change the class to FilterBar. 

License:
---
FilterBar is released under the MIT license. See LICENSE for details.
