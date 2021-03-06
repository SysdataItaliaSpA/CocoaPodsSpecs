Pod::Spec.new do |s|
  s.name             =  'SysdataCore'
  s.version          =  '1.0.2'
  s.summary          =  'Sysdata Core Library'
  s.homepage         =  'http://www.sysdata.it'
  s.social_media_url =  'https://twitter.com/sysdataitalia'
  s.author           =  { 'Davide Ramo' => 'davide.ramo@sysdata.it' }
  s.source           =  { :svn => 'http://svn.sysdata.it/svnrepo/common-ios/SysdataCore', :tag => "#{s.version}" }
  s.license          =  'Commercial'

  # Platform setup
  s.requires_arc = true
  s.platform     = :ios, "6.0"

  # Exclude optional modules
  s.default_subspec = 'Core'

  # s.source_files   = 'Code'

  # Preserve the layout of headers in the Code directory
  # s.header_mappings_dir = 'Code'

  ### Subspecs

  s.subspec 'Core' do |cs|

    cs.source_files   = 'Code/SDCore.h', 'Code/Core'

    cs.dependency 'SysdataCore/Additions'
    cs.dependency 'SysdataCore/Logger'
    cs.dependency 'SysdataCore/ViewControllers'
    cs.dependency 'SysdataCore/Workflow'

    cs.dependency 'MBProgressHUD', '0.9'
    cs.dependency 'UIColor-Utilities', '1.0.1'
    cs.dependency 'FrameAccessor', '1.3.2'
    cs.dependency 'DCIntrospect-ARC', '0.0.8'

    cs.prefix_header_contents = <<-EOS
#import <SDCore.h>
EOS
  end

  s.subspec 'Additions' do |ad|
    ad.source_files   = 'Code/SDAdditions.h', 'Code/Additions'

    ad.dependency 'SysdataCore/Core'
    ad.dependency 'SysdataCore/Logger'

    ad.prefix_header_contents = <<-EOS
#import <SDAdditions.h>
EOS
  end

  s.subspec 'Logger' do |lg|
    lg.source_files   = 'Code/SDLogger.h', 'Code/Logger'

    lg.dependency 'CocoaLumberjack', '1.9.2-sysdata1'

    lg.prefix_header_contents = <<-EOS
    #import <DDLog.h>
    #import <SDLogger.h>
    EOS
  end

  s.subspec 'ViewControllers' do |vc|
    vc.source_files   = 'Code/SDViewControllers.h', 'Code/ViewControllers', 'Code/ViewControllers/Additions', 'Code/ViewControllers/Base', 'Code/ViewControllers/Containers'
    vc.resources = 'Code/ViewControllers/*.{xib}' , 'Code/ViewControllers/Base/*.{xib}', 'Code/ViewControllers/Containers/*.{xib}'

    vc.dependency 'SysdataCore/Core'
    vc.dependency 'SysdataCore/Widgets/Core'

    vc.prefix_header_contents = <<-EOS
    #import <SDViewControllers.h>
    EOS
  end

  s.subspec 'Workflow' do |wf|
    wf.source_files   = 'Code/SDWorkflow.h', 'Code/Workflow', 'Code/Workflow/Segues'

    wf.dependency 'SysdataCore/Core'
    wf.prefix_header_contents = <<-EOS
    #import <SDWorkflow.h>
    EOS
  end

  s.subspec 'CrashReport' do |cr|
    cr.source_files   = 'Code/SDCrashReport.h', 'Code/CrashReport', 'Code/CrashReport/Crashlytics.framework/Versions/A/Headers/*.h'

    cr.ios.frameworks = 'MessageUI'

    cr.ios.vendored_frameworks = 'Code/CrashReport/Crashlytics.framework'
    cr.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(inherited)' }
    cr.preserve_paths = 'Code/CrashReport/Crashlytics.framework'

    cr.dependency 'SSZipArchive', '0.3.2'
    cr.dependency 'objective-zip', '0.8.3'
    cr.dependency 'SysdataCore/Core'

    cr.prefix_header_contents = <<-EOS
#import <SDCrashReport.h>
EOS
  end

  s.subspec 'Analytics' do |an|
    an.source_files   = 'Code/SDAnalytics.h', 'Code/Analytics'

    an.dependency 'GoogleAnalytics-iOS-SDK', '3.10'
    an.dependency 'SysdataCore/Core'

    an.prefix_header_contents = <<-EOS
    #import <SDAnalytics.h>
    EOS
  end

  s.subspec 'CoreData' do |cd|
    cd.source_files   = 'Code/SDCoreData.h', 'Code/CoreData', 'Code/CoreData/Additions'

    cd.ios.frameworks = 'CoreData'

    cd.dependency 'RestKit', '0.23.3-sysdata1'
    cd.dependency 'SysdataCore/Core'

    cd.prefix_header_contents = <<-EOS
#import <SDCoreData.h>
EOS
  end

  s.subspec 'DataModel' do |dm|
    dm.source_files   = 'Code/SDDataModel.h', 'Code/DataModel'

    dm.dependency 'MagicalRecord/Shorthand', '2.2'

    dm.dependency 'SysdataCore/Core'
    dm.dependency 'SysdataCore/CoreData'

    dm.prefix_header_contents = <<-EOS
#import <SDDataModel.h>
EOS
  end

  s.subspec 'Download' do |dw|
    dw.source_files   =  'Code/SDDownload.h', 'Code/Download', 'Code/Download/Additions'

    dw.ios.frameworks = 'SystemConfiguration', 'MobileCoreServices'

    dw.dependency 'SysdataCore/Core'
    dw.dependency 'AFNetworking', '~> 1.3.0'

    dw.prefix_header_contents = <<-EOS
#import <SDDownload.h>
EOS
  end

  s.subspec 'Keychain' do |kc|
    kc.source_files   = 'Code/SDKeychain.h', 'Code/Keychain'

    kc.dependency 'FXKeychain', '1.5.2'

    kc.prefix_header_contents = <<-EOS
#import <SDKeychain.h>
EOS
  end

  s.subspec 'Location' do |lo|
    lo.source_files   = 'Code/SDLocation.h', 'Code/Location'

    lo.dependency 'SysdataCore/Core'

    lo.prefix_header_contents = <<-EOS
#import <SDLocation.h>
EOS
  end

  s.subspec 'Social' do |sc|
    sc.source_files   = 'Code/SDSocial.h', 'Code/Social'

    sc.dependency 'SysdataCore/Core'

    sc.prefix_header_contents = <<-EOS
#import <SDSocial.h>
EOS
  end

  s.subspec 'Sync' do |sy|

    sy.default_subspec = 'Core'

    sy.subspec 'Core' do |sycore|
      sycore.source_files   = 'Code/SDSync.h', 'Code/Sync', 'Code/Sync/Additions'

      sycore.ios.frameworks = 'SystemConfiguration', 'MobileCoreServices'

      sycore.dependency 'SysdataCore/Core'
      sycore.dependency 'SysdataCore/DataModel'

      sycore.prefix_header_contents = <<-EOS
      #import <SDSync.h>
      EOS
    end

    sy.subspec 'HTTP' do |syhttp|
      syhttp.source_files   = 'Code/SDSyncHTTP.h', 'Code/Sync/HTTP'

      syhttp.dependency 'SysdataCore/Sync/Core'

      syhttp.prefix_header_contents = <<-EOS
      #import <SDSyncHTTP.h>
      EOS
    end

    sy.subspec 'MQTT' do |symqtt|
      symqtt.source_files   = 'Code/SDSyncMQTT.h', 'Code/Sync/MQTT'

      symqtt.dependency 'MQTTKit', '0.1.0-sysdata1'

      symqtt.dependency 'SysdataCore/Sync/Core'

      symqtt.prefix_header_contents = <<-EOS
      #import <SDSyncMQTT.h>
      EOS
    end

  end

  s.subspec 'Widgets' do |wd|

    wd.default_subspec = 'Core'

    wd.subspec 'Core' do |wdcore|

      wdcore.source_files   = 'Code/SDWidgets.h', 'Code/Widgets', 'Code/Widgets/Core', 'Code/Widgets/Core/**/*.{h,m}'
      wdcore.resources = 'Code/Widgets/*.{xib}', 'Code/Widgets/Core/*.{xib}', 'Code/Widgets/Core/**/*.{xib}'

      wdcore.dependency 'SysdataCore/Core'

      wdcore.prefix_header_contents = <<-EOS
      #import <SDWidgets.h>
      EOS
    end

    wd.subspec 'Other' do |wdother|

      wdother.source_files   = 'Code/SDWidgetsOther.h', 'Code/Widgets/Other', 'Code/Widgets/Other/**/*.{h,m}'
      wdother.resources = 'Code/Widgets/Other/*.{xib}', 'Code/Widgets/Other/**/*.{xib}'

      wdother.dependency 'SysdataCore/Widgets/Core'

      wdother.prefix_header_contents = <<-EOS
      #import <SDWidgetsOther.h>
      EOS
    end

  end

  s.subspec 'DocReader' do |doc|

    doc.default_subspec = 'Core'

    doc.subspec 'Core' do |doccore|

      doccore.source_files   = 'Code/SDDocReader.h', 'Code/DocReader'

      doccore.dependency 'SysdataCore/Core'

      doccore.prefix_header_contents = <<-EOS
      #import <SDDocReader.h>
      EOS
    end

    doc.subspec 'FastPDFKit' do |docpdf|

      docpdf.source_files   = 'Code/SDDocReaderFastPDFKit.h', 'Code/DocReader/FastPDFKit'

      docpdf.dependency 'FastPdfKit', '1.0.0-sysdata1'

      docpdf.dependency 'SysdataCore/DocReader/Core'

      docpdf.prefix_header_contents = <<-EOS
      #import <SDDocReaderFastPDFKit.h>
      EOS
    end

  end

end
