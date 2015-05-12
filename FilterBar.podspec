Pod::Spec.new do |s|

  s.name         = "FilterBar"
  s.version      = "2.0.0"
  s.summary      = "A filter bar, similar to a UISegmentedControl."
  s.description  = <<-DESC
	       A filter bar, similar to a UISegmentedControl. Written in Swift, and uses autolayout.
                   DESC
  s.homepage     = "https://github.com/MosheBerman/FilterBar"
  s.screenshots  = "https://raw.github.com/MosheBerman/FilterBar/master/Promo.png"
  s.author       = { "Moshe Berman" => "moshberm@gmail.com" }
  s.license 	   = 'MIT'
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/MosheBerman/FilterBar.git", :tag => s.version.to_s} 
  s.source_files  = 'Classes', 'Source/FilterBar.swift'
  s.requires_arc = true
end
