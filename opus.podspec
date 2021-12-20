#
# Be sure to run `pod lib lint opus.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'opus'
  s.version          = '1.3'
  s.summary          = 'Opus framework for DiyalogEngine.'
  s.homepage         = 'https://github.com/diyalog-im/opus'
  s.license          = { :type => 'https://opus-codec.org/license/', :file => 'LICENSE' }
  s.author           = { 'Diyalog' => 'diyalog-im@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/diyalog-im/opus.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.public_header_files = "opus/opus.xcframework/ios-arm64_armv7_armv7s/opus.framework/Headers/*.h"
  s.source_files     = "opus/opus/Headers/*.h"

  
  s.prepare_command = <<-CMD
      echo 'fetching opus.xcframework'
      curl -OL 'https://diyalog.im/app/pkgs/ios_frameworks/opus/1.3/opus.zip'
      rm -fr 'opus.xcframework'
      echo 'unzipping opus.xcframework'
      unzip -o -q opus.zip
      echo 'cleaning files'
      rm opus.zip
    CMD

  s.vendored_frameworks = 'opus.xcframework'

  s.xcconfig = {
     "FRAMEWORK_SEARCH_PATHS" => "${PODS_ROOT}/opus",
     "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/opus"
	
  }
  
end
