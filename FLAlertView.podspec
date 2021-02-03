Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  spec.name         = "FLAlertView"
  spec.version      = '1.1.0'
  spec.summary      = "FLAlertView is a Flat Customizable AlertView, written in Swift"
  spec.description  = <<-DESC
  FLAlertView is a Flat Customizable AlertView, written in Swift for Projects on Swift
                   DESC

  spec.homepage     = "https://github.com/felarmir/FLAlertView"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = {type: 'MIT', file: 'LICENSE'}


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  spec.author             = { "Denis Andreev" => "felarmir@gmail.com" }

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  spec.source       = { :git => "https://github.com/felarmir/FLAlertView.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  spec.ios.deployment_target = '10.0'
  spec.swift_version = '5.0'

  spec.source_files  = "FLAlertView/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  spec.resources = "FLAlertView/*.png"

end
