Pod::Spec.new do |s|
  s.name         = "MQTT-Client-Framework"
  s.version      = "0.0.2-sysdata1"
  s.summary      = "IOS native ObjectiveC MQTT Framework"
  s.homepage     = "https://github.com/ckrey/MQTT-Client-Framework"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Christoph Krey" => "krey.christoph@gmail.com" }
  s.source       = { :git => "https://github.com/SysdataItaliaSpA/MQTT-Client-Framework.git", :tag => "#{s.version}" }

  s.source_files = "MQTTClient/MQTTClient", "MQTTClient/MQTTClient/**/*.{h,m}"
  s.requires_arc = true

  s.ios.deployment_target = "7.0"
end
