Pod::Spec.new do |s|
  ###
  ### Meta data
  ###
  s.name             = 'ICACrashReporter'
  s.version          = '1.3.0'
  s.summary          = 'The iCapps Crash Reporture component for iOS applications.'
  s.license       = {
    type: 'Commercial',
    text: 'Copyright (C) 2015 iCapps'
  }
  s.homepage         = 'https://github.com/icapps/ios-crash-reporter'
  s.author           = { 'Leroy' => 'development@icapps.com' }
  s.source           = {
    git: 'https://github.com/icapps/ios-crash-reporter.git',
    tag: s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/icapps'

  ###
  ### Platform specifications
  ###
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.default_subspec = 'Splunk', 'GoogleAnalytics', 'Crittercism'

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
    ss.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load -undefined dynamic_lookup' }
  end

  ###
  ### Crittercism component
  ###
  s.subspec 'Crittercism' do |ss|
    ss.source_files = [
      'Pod/Classes/Crittercism.h',
      'Pod/Classes/Crittercism/*.{h,m}'
    ]

    ss.dependency 'ICACrashReporter/Core'
    ss.vendored_frameworks = 'Pod/Frameworks/Crittercism.framework'
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
      'Pod/Classes/GoogleAnalytics/*.{h,m}',
      'Pod/Libraries/GoogleAnalytics/Headers/*.h'
    ]

    ss.dependency 'ICACrashReporter/Core'
    ss.vendored_libraries = 'Pod/Libraries/GoogleAnalytics/libGoogleAnalyticsServices.a'
    ss.frameworks = [
      'CoreData',
      'SystemConfiguration',
      'WebKit'
    ]
    ss.libraries = [
      'z',
      'sqlite3'
    ]
  end
end
