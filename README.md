# FilterBar
A filter bar, similar to a UISegmentedControl. Written in Swift, and uses autolayout.

Getting Started:
---
Add `FilterBar.swift` to your project. CocoaPods coming soon.

Using the FilterBar:
---
You can create a filter bar in code, or using Interface Builder. FilterBar provides first-class interface builder support, including simulated buttons, and the ability to tint the FilterBar right from Interface Builder.

Position the FilterBar:
---
FilterBar uses an intrinsic size and a pair of layout constraints to ensure that it remains centered in and stretched across its superview. You only need to provide a Y position constraint for it.


Setting the Titles:
---
To choose what titles are shown on the filter bar, set the `titles` property of the filter bar. FilterBar will then trigger a layout update and automatically generate the segments. For example: 

    filterBar.titles = ["Apples", "Bananas", "Cherries"]

This will cause the filter bar to display three buttons with Apples, Bananas, and Cherries as the titles, respectively.

Checking which Segment is Selected:
---
Use the `selectedSegmentIndex` property.

Getting Events:
---
FilterBar is a subclass of `UIControl`, so you can either wire up an IBAction to "Value Changed" or use the following line of code:

    filterBar.addTarget(self, action: "segmentChanged:", forControlEvents: .ValueChanged)

This assumes that you have a handler called `segmentChanged` and that your filter bar is called `filterBar`.

Coloring the Filter Bar:
--- 
Use the `color` property. For example:

    filterBar.color = UIColor.redColor()

Will cause the filter bar to have a red tint. Personally, I think a black or white color works well for most cases, because the background color will bleed through.


Interface Builder Support:
---
FilterBar supports Interface Builder in several ways. You can set the color of the bar, and FilterBar will render a preview in interface builder.

License:
---
FilterBar is released under the MIT license. See LICENSE for details.
