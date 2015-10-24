source 'https://github.com/CocoaPods/Specs.git'
workspace 'instacopy'
platform :ios, "9.0"
use_frameworks!

xcodeproj 'instacopy/instacopy'

target :instacopy, :exclusive => true do
    xcodeproj 'instacopy/instacopy'
    link_with 'instacopy'

    pod 'InstagramKit', '~> 3.6' ,:inhibit_warnings => true
	pod 'InstagramKit/UICKeyChainStore',:inhibit_warnings => true
	
	pod 'SDWebImage', '~> 3.7'
end

