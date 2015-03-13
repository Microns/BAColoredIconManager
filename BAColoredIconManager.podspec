#
# Be sure to run `pod lib lint BAColoredIconManager.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BAColoredIconManager"
  s.version          = "0.1.0"
  s.summary          = "BAColoredIconManager allows you to color black on transparent PNG icons in any color at runtime."
  s.homepage         = "https://github.com/Microns/BAColoredIconManager"
  s.license          = 'MIT'
  s.author           = { "Marcus Fleischmann" => "marcus@bitartists.com" }
  s.source           = { :git => "https://github.com/Microns/BAColoredIconManager.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BAColoredIconManager' => ['Pod/Assets/*.png']
  }

	s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
end
