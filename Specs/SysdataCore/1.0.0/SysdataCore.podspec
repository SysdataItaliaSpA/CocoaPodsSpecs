Pod::Spec.new do |s|
  s.name             =  'SysdataCore'
  s.version          =  '1.0.0'
  s.summary          =  'Sysdata Core Library'
  s.homepage         =  'http://www.sysdata.it'
  s.social_media_url =  'https://twitter.com/sysdataitalia'
  s.author           =  { 'Davide Ramo' => 'davide.ramo.ve@gmail.ve' }
  s.source           =  { :svn => 'http://svn.sysdata.it/svnrepo/common-ios/SysdataCore', :tag => "#{s.version}" }
  s.license          =  'Apache License, Version 2.0'

  # Platform setup
  s.requires_arc = true
  s.platform     = :ios, "6.0"

  # Exclude optional modules
  s.default_subspec = 'Core'

  # Preserve the layout of headers in the Code directory
  s.header_mappings_dir = 'Code'

  ### Subspecs

  s.subspec 'Core' do |cs|

    cs.source_files   = 'Code'

    cs.dependency 'SysdataCore/Additions'
    cs.dependency 'SysdataCore/Logger'
    cs.dependency 'SysdataCore/ViewControllers'
    cs.dependency 'SysdataCore/Workflow'

    # cs.dependency 'SysdataCore/CrashReport'
    # cs.dependency 'SysdataCore/DataModel'
    # cs.dependency 'SysdataCore/Download'
    # cs.dependency 'SysdataCore/Keychain'
    # cs.dependency 'SysdataCore/Location'
    # cs.dependency 'SysdataCore/Social'
    # cs.dependency 'SysdataCore/Sync'

    # cs.dependency 'SysdataCore/Widgets'



    cs.dependency 'RestKit', '0.23.3-sysdata1'
    cs.dependency 'FastPdfKit', '1.0.0-sysdata1'
    cs.dependency 'MagicalRecord/Shorthand', '2.2'
    cs.dependency 'MBProgressHUD', '0.9'
    cs.dependency 'UIColor-Utilities', '1.0.1'
    cs.dependency 'DCIntrospect-ARC', '0.0.8'
    cs.dependency 'FrameAccessor', '1.3.2'
    cs.dependency 'FXKeychain', '1.5.2'
    cs.dependency 'SSZipArchive', '0.3.2'
    cs.dependency 'objective-zip', '0.8.3'

  end

  s.subspec 'CoreData' do |cd|
    cd.source_files   = 'Code/CoreData', 'Code/CoreData/Additions'
    cd.prefix_header_contents = <<-EOS
#import <CoreData/CoreData.h>
EOS
  end

  s.subspec 'Additions' do |ad|
    ad.source_files   = 'Code/Additions'
    ad.dependency 'SysdataCore/Logger'
  end

  s.subspec 'CrashReport' do |cr|
    cr.source_files   = 'Code/CrashReport', 'Code/CrashReport/Crashlytics.framework/Versions/A/Headers/*.h'
    cr.ios.vendored_frameworks = 'Code/CrashReport/Crashlytics.framework'
    cr.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)' }
    cr.preserve_paths = 'Code/CrashReport/Crashlytics.framework'
  end

  s.subspec 'DataModel' do |dm|
    dm.source_files   = 'Core/DataModel'
    dm.dependency 'SysdataCore/CoreData'
  end

  s.subspec 'Download' do |dw|
    dw.source_files   = 'Code/Download'
  end

  s.subspec 'Keychain' do |kc|
    kc.source_files   = 'Code/Keychain'
  end

  s.subspec 'Location' do |lo|
    lo.source_files   = 'Code/Location'
  end

  s.subspec 'Logger' do |lg|
    lg.source_files   = 'Code/Logger'
    lg.dependency 'CocoaLumberjack', '1.9.2-sysdata1'

    lg.prefix_header_contents = <<-EOS
#import <DDLog.h>
EOS
  end

  s.subspec 'Social' do |sc|
    sc.source_files   = 'Code/Social'
  end

  s.subspec 'Sync' do |sy|
    sy.source_files   = 'Code/Sync'
  end

  s.subspec 'ViewControllers' do |vc|
    vc.source_files   = 'Code/ViewControllers'
  end

  s.subspec 'Widgets' do |wd|
    wd.source_files   = 'Code/Widgets', 'Code/Widgets/**/*.{h,m}'
  end

  s.subspec 'Workflow' do |wf|
    wf.source_files   = 'Code/Workflow'
  end


end
