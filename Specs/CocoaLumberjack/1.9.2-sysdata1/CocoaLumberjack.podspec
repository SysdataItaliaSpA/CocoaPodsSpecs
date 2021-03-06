Pod::Spec.new do |s|
  s.name     = 'CocoaLumberjack'
  s.version  = '1.9.2-sysdata1'
  s.license  = 'BSD'
  s.summary  = 'A fast & simple, yet powerful & flexible logging framework for Mac and iOS.'
  s.homepage = 'https://github.com/SysdataItaliaSpA/CocoaLumberjack'
  s.author   = { 'Robbie Hanson' => 'robbiehanson@deusty.com' }
  s.source   = { :git => 'https://github.com/SysdataItaliaSpA/CocoaLumberjack.git',
                 :tag => "#{s.version}" }

  s.description = 'It is similar in concept to other popular logging frameworks such as log4j, '   \
                  'yet is designed specifically for objective-c, and takes advantage of features ' \
                  'such as multi-threading, grand central dispatch (if available), lockless '      \
                  'atomic operations, and the dynamic nature of the objective-c runtime.'

  s.requires_arc   = true

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.preserve_paths = 'Lumberjack/**/README*'

  s.public_header_files = 'Lumberjack/**/*.h'

  s.default_subspec = 'Extensions'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Lumberjack/*.{h,m}'
  end

  s.subspec 'Extensions' do |ss|
    ss.dependency 'CocoaLumberjack/Core'
    ss.source_files = 'Lumberjack/Extensions/*.{h,m}'
  end

  s.subspec 'CLI' do |ss|
      ss.dependency 'CocoaLumberjack/Core'
      ss.source_files = 'Lumberjack/CLI/*.{h,m}'
  end

end
