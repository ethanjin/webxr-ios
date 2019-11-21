# cmblife test Lib

Pod::Spec.new do |s|
  s.name                  = 'WebXR'
  s.version               = '0.1.0'
  s.summary               = 'WebXR测试工程'
  s.description           = <<-DESC
                            WebXR测试工程
                            DESC
  s.homepage              = 'http://git.cs'
  s.author                = { 'cmb' => 'cmbchina.com' }
  s.license               = { :'type' => 'Copyright', :'text' => ' Copyright 2010-2019 CMB. All Rights Reserved. '}
  s.source                = { :git => 'git@git.cs:iOS_Common/CMBTestLib.git', :tag => "#{s.version}" }

  s.platform = :ios, '12.0'
  # s.static_framework = true

  s.cocoapods_version = '>= 1.4.0'
  if s.respond_to?(:swift_versions) then
    s.swift_versions = ['4.2', '5.0']
  else
    s.swift_version = '4.2'
  end

  s.pod_target_xcconfig = {
    'ENABLE_BITCODE' => 'NO',
    'GCC_PREPROCESSOR_DEFINITIONS' => ['$(inherited)', 'SEND_PLANES_BY_DEFAULT=0', 'DEBUG=1', 'TargetFramework=1'],
    'DEFINES_MODULE' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -Xlinker -no_application_extension',
    'OTHER_SWIFT_FLAGS' => '$(inherited) -suppress-warnings',
    'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks',
    # 'SWIFT_OBJC_BRIDGING_HEADER' => 'XRViewer/Resources/XRViewer-Bridging-Header.h'
    # 'LIBRARY_SEARCH_PATHS' => "$(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME)"
  }

  s.source_files = ['XRViewer/**/*.{swift,h,m,mm}', 'WebXR/**/*.{swift,h,m,mm}']
  s.exclude_files = ['XRViewer/AppDelegate.swift', 'XRViewer/Resources/XRViewer-Bridging-Header.h']
  s.public_header_files = ['XRViewer/**/*.h', 'WebXR/**/*.h']
  s.resources = ['XRViewer/**/*.{png,jpg,caf,gif,xib,scnassets,bundle}', 'Web/*', 'XRViewer/Resources/GoogleService-Info.plist', 'WebXR/**/*.{png,jpg,caf,gif,xib,storyboard,scnassets,bundle}']
  s.resource_bundles = { 'Resources' => ['XRViewer/**/*.xcassets']}

end
