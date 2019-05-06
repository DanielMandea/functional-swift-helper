Pod::Spec.new do |s|
  s.name             = 'FunctionalSwiftHelper'
  s.version          = '0.1.1'
  s.summary          = 'Based on functional monads we have a light weight framework for futures and promises'
  s.description      = <<-DESC
 Based on functional monads we have a light weight framework for futures and promises .
                       DESC
  s.homepage         = 'https://github.com/DanielMandea/functional-swift-helper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'daniel.mandea@yahoo.com' => 'daniel.mandea@ro.ibm.com' }
  s.source           = { :git => 'https://github.com/DanielMandea/functional-swift-helper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MandeaDaniel'

  s.ios.deployment_target = '12.0'
  s.swift_version   = "5"
  s.source_files = 'FunctionalSwiftHelper/Classes/**/*'
end
