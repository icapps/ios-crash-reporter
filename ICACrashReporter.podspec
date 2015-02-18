Pod::Spec.new do |spec|
  spec.name         = 'ICACrashReporter'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://bitbucket.org/icapps/pod_icacrashreporter'
  spec.author       = { "Pieterjan Vandegaer" => "pieterjan.vandegaer@icapps.com" }
  spec.summary      = 'iCapps Crash Reporting assistant'
  spec.source       = { :git => 'https://bitbucket.org/icapps/pod_icacrashreporter.git', :tag => '1.0.0' }
  spec.source_files = 'ICACrashReporter.{h,m}'
end