
Pod::Spec.new do |spec|

  spec.name         = "HKStyle"
  spec.version      = "1.0.2"
  spec.summary      = "This is my usual setting property."
   spec.source       = { :git => 'https://github.com/Hiroki0613/HKStyle.git', :tag => 'v1.0.2' }
  spec.homepage     = "https://github.com/Hiroki0613/HKStyle"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author    = "Hiroki Kondo"
  spec.social_media_url   = "https://twitter.com/HirokiMac"
  spec.platform     = :ios, "13.0"
  spec.source_files  = "HKStyle/**/*.{h,swift}"
  spec.swift_version = "5.0"

end
