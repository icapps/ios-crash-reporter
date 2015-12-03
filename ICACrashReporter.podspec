Pod::Spec.new do |s|
  ###
  ### Meta data
  ###
  s.name             = 'ICACrashReporter'
  s.version          = '1.2.0'
  s.summary          = 'The iCapps Crash Reporture component for iOS applications.'
  s.license       = {
    type: 'Commercial',
    text: 'Copyright (C) 2015 iCapps'
  }
  s.homepage         = 'https://bitbucket.org/icapps/pod_icacrashreporter'
  s.author           = { 'Jelle Vandebeeck' => 'development@icapps.com' }
  s.source           = {
    git: 'https://bitbucket.org/icapps/pod_icacrashreporter.git',
    tag: s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/icapps'

  ###
  ### Platform specifications
  ###
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.default_subspec = 'Splunk', 'GoogleAnalytics'

  ###
  ### Core component
  ###
  s.subspec 'Core' do |ss|
    ss.source_files = [
      'Pod/Classes/Core.h',
      'Pod/Classes/Core/*.{h,m}',
      'Pod/Classes/Console/*.{h,m}',
      'Pod/Classes/Multi/*.{h,m}'
    ]
  end

  ###
  ### Splunk component
  ###
  s.subspec 'Splunk' do |ss|
    ss.source_files = [
      'Pod/Classes/Splunk.h',
      'Pod/Classes/Splunk/*.{h,m}'
    ]

    ss.dependency 'ICACrashReporter/Core'
    ss.vendored_frameworks = 'Pod/Frameworks/SplunkMint.framework'
    ss.frameworks = [
      'CoreTelephony', 
      'SystemConfiguration', 
      'WebKit'
    ]
    ss.libraries = 'z'
    ss.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
  end

  ###
  ### Google Analytics component
  ###
  s.subspec 'GoogleAnalytics' do |ss|
    ss.source_files = [
      'Pod/Classes/GoogleAnalytics.h',
      'Pod/Classes/GoogleAnalytics/*.{h,m}'
    ]

    ss.dependency 'ICACrashReporter/Core'
    ss.dependency 'Google/Analytics', '~> 1.0'
  end
end
