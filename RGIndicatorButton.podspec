#
# Be sure to run `pod lib lint RGIndicatorButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RGIndicatorButton"
  s.version          = "0.1.0"
  s.summary          = "A simple iOS button with Activit  yIndicator"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Support the background color of UIButton in normal and highlighted state.
                       DESC

  s.homepage         = "https://github.com/realgreys/RGIndicatorButton"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "realgreys" => "realgreys@gmail.com" }
  s.source           = { :git => "https://github.com/realgreys/RGIndicatorButton.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RGIndicatorButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RGIndicatorButton' => ['RGIndicatorButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
