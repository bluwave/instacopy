source 'https://github.com/CocoaPods/Specs.git'
workspace 'instacopy'
platform :ios, "9.0"

xcodeproj 'instacopy/instacopy'

target :instacopy, :exclusive => true do
    xcodeproj 'instacopy/instacopy'
    link_with 'instacopy'

    pod 'InstagramKit', '~> 3.6'
end

