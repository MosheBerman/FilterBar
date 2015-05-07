# FilterBar
A filter bar, similar to a UISegmentedControl. Written in Swift, and uses autolayout.

Getting Started:
---
Add `FilterBar.swift` to your project.

Using the FilterBar:
---
You can create a filter bar in code, or using Interface Builder. FilterBar provides first-class interface builder support, including simulated buttons, and the ability to tint the FilterBar right from Interface Builder.

Position the FilterBar:
---
FilterBar uses an intrinsic size and a pair of layout constraints to ensure that it remains centered in and stretched across its superview. You only need to provide a Y position constraint for it.


Setting the Titles:
---
To choose what titles are shown on the filter bar, set the `titles` property of the filter bar. FilterBar will then trigger a layout update and automatically generate the segments.

Checking which Segment is Selected:
---
Use the `selectedSegmentIndex` property.

Coloring the Filter Bar:
--- 
Use the `color` property.

Interface Builder Support:
---
FilterBar supports autolayout.

License:
---
FilterBar is released under the MIT license. See LICENSE for details.
