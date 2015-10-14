Pod::Spec.new do |spec|
  spec.name         = 'ICACrashReporter'
  spec.version      = '1.0.10'
  spec.license      = {
      :type => 'Commercial',
      :text => <<-LICENSE
                Copyright (C) 2015 iCapps
      LICENSE
    }
  spec.homepage     = 'https://bitbucket.org/icapps/pod_icacrashreporter'
  spec.author       = { "Pieterjan Vandegaer" => "pieterjan.vandegaer@icapps.com" }
  spec.summary      = 'iCapps Crash Reporting assistant'
  spec.source       = { :git => 'https://bitbucket.org/icapps/pod_icacrashreporter.git', :tag => spec.version }
  spec.platform = :ios, "7.0"

  spec.subspec 'Core' do |core|
  core.source_files = "ICACrashReporter*.{h,m}", "Console/*.{h,m}", "Multi/*.{h,m}"
  end

  spec.subspec 'Splunk' do |splunk|
  splunk.source_files = "Splunk/*.{h,m}"
  splunk.dependency 'ICACrashReporter/Core'
  splunk.dependency 'SplunkMint', '~> 4.4'
  end

  spec.subspec 'GoogleAnalytics' do |googleanalytics|
  googleanalytics.source_files = "GoogleAnalytics/*.{h,m}"
  googleanalytics.dependency 'ICACrashReporter/Core'
  googleanalytics.dependency 'Google/Analytics', '~> 1.0'
  end

end
