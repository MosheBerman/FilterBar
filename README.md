![Promo](https://github.com/MosheBerman/FilterBar/raw/master/Promo.png)

# FilterBar

What happens if you combine UINavigationBar and UISegmentedControl? FilterBar.

FilterBar is a fancy implementation of UISegmentedControl that is designed to look good beneath navigation bars, search fields, and really anywhere else in your app. 

It's designed to stretch across its superview and handle segment layout nicely. 

Getting Started:
---

With CocoaPods:

    pod 'FilterBar', '~>2.0.0'

Cocoapods requires iOS 8.0 or higher. 

If you're supporting iOS 7, or if you prefer, you can just drop `FilterBar.swift` to your project. 

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


FilterBar Tint Color
---
 To set the tint of the FilterBar, use `barTintColor`. For example:

        //  Color the filter bar
        filter.barTintColor = UIColor.whiteColor()
        
This will cause the filter bar to have a white background. 

**Note:**Previously, `barTintColor` was named `color`. The `color` property is deprecated. Setting the `color` property now sets the `barTintColor` property, but in future versions, `color` will be removed.

FilterBar Translucency
---

FilterBar can be opaque or translucent. Turn translucency on or off with the `translucent` property.

        //  Enable translucency
        filter.translucent = true

Segment Text Color
---
To set the color of the text in the FilterBar's segments, use the `tintColor` property.

        //  Color the text
        filter.tintColor = UIColor.whiteColor()

Border Color
---

FilterBar supplies a 0.5 point border that's black and transparent.

The previous version of FilterBar allowed the setting of a borderColor property. This is no longer supported, because FilterBar now mimics the appearance of UINavigationBar much more closely. 

The `borderColor` property is deprecated, and setting it does nothing.

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
