Pod::Spec.new do |s|
  s.name         = 'CoreTextWrapper'
  s.version      = '1.1'
  s.authors      = { 'Adrian Kosmaczewski' => 'akosma@gmail.com' }
  s.license      = 'LICENSE'
  s.homepage     = 'http://akosma.github.io/CoreTextWrapper'
  s.summary      = 'An Objective-C wrapper around Core Text for creating multi-column text and loading custom fonts.'
  s.source       = { :git => 'https://github.com/akosma/CoreTextWrapper.git', :tag => "#{s.version}" }
  s.source_files = "Classes/**/*.*"
  s.platform     = :ios
end
