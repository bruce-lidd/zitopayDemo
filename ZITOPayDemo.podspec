Pod::Spec.new do |s|
    s.name             = 'ZITOPayDemo'
    s.version          = '0.1.1'
    s.summary          = 'ZITOPay iOS SDK'
    s.description      = <<-DESC
                        移动应用支付接口。
                        开发者不再需要编写冗长的代码，简单几步就可以使你的应用获得支付功能。
                        让你的移动应用接入支付像大厦接入电力一样简单，方便，和温暖。
                        支持微信支付，支付宝钱包。
                       DESC

    s.homepage         = 'http://www.zitopay.com'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'bruce_lidd' => '964991296@qq.com' }
    s.source           = { :git => 'https://github.com/bruce-lidd/zitopayDemo.git', :tag => s.version.to_s }

    s.ios.deployment_target = '9.0'
    s.source_files = 'ZITOPayDemo/Classes/**/*'

    s.requires_arc = true
    s.default_subspec = 'Core', 'Alipay', 'Sumpay'

    s.subspec 'Core' do |core|
        core.source_files = 'lib/*.h'
        core.public_header_files = 'lib/*.h'
        core.vendored_libraries = 'lib/*.a'
        core.frameworks = 'CFNetwork', 'SystemConfiguration', 'Security'
        core.ios.library = 'c++', 'stdc++', 'z'
        core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
    end

    s.subspec 'Alipay' do |ss|
        ss.vendored_libraries = 'lib/Channels/Alipay/*.a'
        ss.ios.vendored_frameworks = 'lib/Channels/Alipay/AlipaySDK.framework'
        ss.resource = 'lib/Channels/Alipay/AlipaySDK.bundle'
        ss.frameworks = 'CoreMotion', 'CoreTelephony'
        ss.dependency 'ZITOPayDemo/Core'
    end

    s.subspec 'Sumpay' do |ss|
        ss.vendored_libraries = 'lib/Channels/Sumpay/*.a'
        ss.dependency 'ZITOPayDemo/Core'
    end

end
