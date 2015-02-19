Pod::Spec.new do |s|

  s.name         = "MQTTKit"
  s.version      = "0.1.0-sysdata6"
  s.summary      = "Objective-C client for MQTT 3.1"
  s.homepage     = "https://github.com/SysdataItaliaSpA/MQTTKit"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author       = { "Davide Ramo" => "davide.ramo@sysdata.it" }
  s.ios.platform = :ios, '6.0'
  # for using GCD queue as Objective-C objects
  s.ios.deployment_target = "6.0"
  s.osx.platform = :osx, '10.9'
  s.source       = { :git => "https://github.com/SysdataItaliaSpA/MQTTKit.git", :tag => "#{s.version}" }

  s.source_files  = 'libmosquitto/*.{h,c}', 'MQTTKit/*.{h,m}'
  s.public_header_files = 'MQTTKit/MQTTKit.h'

  s.requires_arc = true
  s.compiler_flags = '-DWITH_TLS', '-DWITH_THREADING'

  s.dependency 'OpenSSL-Universal', '~> 1.0.1'

end
