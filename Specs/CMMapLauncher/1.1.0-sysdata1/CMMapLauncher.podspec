Pod::Spec.new do |s|
  s.name         = "CMMapLauncher"
  s.version      = "1.1.0-sysdata1"
  s.summary      = "CMMapLauncher is a mini-library for iOS that makes it quick and easy to show directions in various mapping applications."
  s.homepage     = "https://github.com/SysdataItaliaSpA/CMMapLauncher"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'SysdataItalia S.p.A'
  s.platform     = :ios
  s.source       = { :git => "https://github.com/citymapper/CMMapLauncher.git", :tag => "#{s.version}" }
  s.source_files  = 'CMMapLauncher'
  s.framework  = 'MapKit'
  s.requires_arc = true
end
