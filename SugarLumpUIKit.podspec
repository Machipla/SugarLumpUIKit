Pod::Spec.new do |spec|
  spec.name          = 'SugarLumpUIKit'
  spec.homepage      = "https://github.com/Machipla/SugarLumpUIKit"
  spec.version       = '0.0.2'
  spec.platform      = :ios, "9.0"
  spec.authors       = 'Mario Chinchilla'
  spec.summary       = 'The UIKit module of SugarLump pod'
  spec.license       = { :type => "MIT", :file => "LICENSE.md" }
  spec.source        = { :git => 'https://github.com/Machipla/SugarLumpUIKit.git', :tag => "#{spec.version}" }
  spec.swift_version = '4.0'

  spec.source_files = 'Sources/**/*.{swift}'
  spec.frameworks   = 'Foundation', 'UIKit'
  spec.dependency     'SugarLumpFoundation'
  spec.dependency     'SugarLumpCoreGraphics'
end