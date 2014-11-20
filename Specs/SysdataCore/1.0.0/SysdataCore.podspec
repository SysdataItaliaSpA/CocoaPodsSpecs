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

  s.source_files   = 'Code'

  # Preserve the layout of headers in the Code directory
  s.header_mappings_dir = 'Code'

  ### Subspecs

  s.subspec 'Core' do |cs|

    cs.source_files   = 'Code/SDCore.h', 'Code/Core'

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


    cs.dependency 'FastPdfKit', '1.0.0-sysdata1'
    cs.dependency 'MBProgressHUD', '0.9'
    cs.dependency 'UIColor-Utilities', '1.0.1'
    cs.dependency 'DCIntrospect-ARC', '0.0.8'
    cs.dependency 'FrameAccessor', '1.3.2'

    cs.dependency 'SSZipArchive', '0.3.2'
    cs.dependency 'objective-zip', '0.8.3'

    cs.prefix_header_contents = <<-EOS
#import <SDCore.h>
EOS
  end

  s.subspec 'CoreData' do |cd|
    cd.source_files   = 'Code/CoreData', 'Code/CoreData/Additions'

    cd.dependency 'RestKit', '0.23.3-sysdata1'
    cd.dependency 'MagicalRecord/Shorthand', '2.2'
    cd.dependency 'SysdataCore/Core'

    cd.prefix_header_contents = <<-EOS
#import <CoreData/CoreData.h>
EOS
  end

  s.subspec 'Additions' do |ad|
    ad.source_files   = 'Code/Additions'

    ad.dependency 'SysdataCore/Core'
    ad.dependency 'SysdataCore/Logger'
  end

  s.subspec 'CrashReport' do |cr|
    cr.source_files   = 'Code/CrashReport', 'Code/CrashReport/Crashlytics.framework/Versions/A/Headers/*.h'
    cr.ios.vendored_frameworks = 'Code/CrashReport/Crashlytics.framework'
    cr.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)' }
    cr.preserve_paths = 'Code/CrashReport/Crashlytics.framework'

    cr.dependency 'SysdataCore/Core'
  end

  s.subspec 'DataModel' do |dm|
    dm.source_files   = 'Core/DataModel'

    dm.dependency 'SysdataCore/Core'
    dm.dependency 'SysdataCore/CoreData'
  end

  s.subspec 'Download' do |dw|
    dw.source_files   = 'Code/Download', 'Code/Download/Additions'

    dw.dependency 'SysdataCore/Core'
    dw.dependency 'AFNetworking', '~> 1.3.0'
  end

  s.subspec 'Keychain' do |kc|
    kc.source_files   = 'Code/Keychain'

    kc.dependency 'FXKeychain', '1.5.2'
  end

  s.subspec 'Location' do |lo|
    lo.source_files   = 'Code/Location'

    lo.dependency 'SysdataCore/Core'
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

    sc.dependency 'SysdataCore/Core'
  end

  s.subspec 'Sync' do |sy|
    sy.source_files   = 'Code/Sync', 'Code/Sync/Additions'

    sy.dependency 'SysdataCore/Core'
    sy.dependency 'SysdataCore/CoreData'
  end

  s.subspec 'ViewControllers' do |vc|
    vc.source_files   = 'Code/SDViewControllers.h', 'Code/ViewControllers', 'Code/ViewControllers/Base', 'Code/ViewControllers/Containers'
    vc.resources = 'Code/ViewControllers/*.{xib}' , 'Code/ViewControllers/Base/*.{xib}', 'Code/ViewControllers/Containers/*.{xib}'

    vc.dependency 'SysdataCore/Core'

    vc.prefix_header_contents = <<-EOS
#import <SDViewControllers.h>
EOS
  end

  s.subspec 'Widgets' do |wd|
    wd.source_files   = 'Code/Widgets', 'Code/Widgets/**/*.{h,m}'
    wd.resources = 'Code/Widgets/*.{xib}', 'Code/Widgets/**/*.{xib}'

    wd.dependency 'SysdataCore/Core'
  end

  s.subspec 'Workflow' do |wf|
    wf.source_files   = 'Code/SDWorkflow.h', 'Code/Workflow', 'Code/Workflow/Segues'

    wf.dependency 'SysdataCore/Core'
    wf.prefix_header_contents = <<-EOS
#import <SDWorkflow.h>
EOS
  end


end
