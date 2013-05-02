Pod::Spec.new do |s|
  s.name         = 'CoreTextWrapper'
  s.version      = '1.0.1'
  s.license      = 'LICENSE'
  s.platform     = :ios

  s.summary      = 'An Objective-C wrapper around Core Text for creating multi-column text and loading custom fonts.'
  s.homepage     = 'http://akosma.github.io/CoreTextWrapper'
  s.author       = { 'Adrian Kosmaczewski' => 'akosma@gmail.com' }
  s.source       = { :git => 'https://github.com/akosma/CoreTextWrapper.git', :tag => '1.0.1' }
end