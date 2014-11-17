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

  # Exclude optional Search and Testing modules
  s.default_subspec = 'Core'

  # Preserve the layout of headers in the Code directory
  s.header_mappings_dir = 'Core'

  ### Subspecs

  s.subspec 'Core' do |cs|
    cs.dependency 'SysdataCore/Additions'
    cs.dependency 'SysdataCore/CrashReport'
    cs.dependency 'SysdataCore/DataModel'
    cs.dependency 'SysdataCore/Download'
    cs.dependency 'SysdataCore/Keychain'
    cs.dependency 'SysdataCore/Location'
    cs.dependency 'SysdataCore/Logger'
    cs.dependency 'SysdataCore/Social'
    cs.dependency 'SysdataCore/Sync'
    cs.dependency 'SysdataCore/ViewControllers'
    cs.dependency 'SysdataCore/Widgets'
    cs.dependency 'SysdataCore/Workflow'
    cs.source_files   = 'Core'

    cs.dependency 'RestKit', '0.23.3-sysdata1'
    cs.dependency 'CocoaLumberjack', '1.9.2-sysdata1'
    cs.dependency 'FastPdfKit', '1.0.0-sysdata1'
    # cd.dependency 'MagicalRecord/Shorthand', '2.2'
    # cd.dependency 'MBProgressHUD', '0.9'
    # cd.dependency 'UIColor-Utilities', '1.0.1'
    # cd.dependency 'DCIntrospect-ARC', '0.0.8'
    # cd.dependency 'FrameAccessor', '1.3.2'
    # cd.dependency 'FXKeychain', '1.5.2'
    # cd.dependency 'SSZipArchive', '0.3.2'
    # cd.dependency 'objective-zip', '0.8.3'
  end

  s.subspec 'Additions' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'CrashReport' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'DataModel' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Download' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Keychain' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Location' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Logger' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Social' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Sync' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'ViewControllers' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Widgets' do |ad|
    ad.source_files   = 'Code/Additions'
  end

  s.subspec 'Workflow' do |ad|
    ad.source_files   = 'Code/Additions'
  end


end
