#
# Be sure to run `pod lib lint GEApplication.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GEApplication'
  s.version          = '0.1.1'
  s.summary          = 'Managing global events in app by sending signal to the listener.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
Sometimes managing and registering all events in the app become to difficult and less efficient. With GEApplication you can register events in the app an read them or fire them from one listener.
            DESC

  s.homepage         = 'https://github.com/HaraldBregu/GEApplication'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Harald Bregu' => 'harald.bregu@gmail.com' }
  s.source           = { :git => 'https://github.com/HaraldBregu/GEApplication.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/HaraldBregu'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GEApplication/Classes/**/*'
  
  s.swift_version = '3.0'

  # s.resource_bundles = {
  #   'GEApplication' => ['GEApplication/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.frameworks = 'UIKit'

end
