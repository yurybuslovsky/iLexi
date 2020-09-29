platform :ios, '13.0'

inhibit_all_warnings!
use_frameworks!

workspace 'iLexi'

def ui_pods
  pod 'SnapKit', '= 5.0.1'
end

def flow_pods
  pod 'RxSwift', '= 5.1.1'
  pod 'RxCocoa', '= 5.1.1'
  pod 'NSObject+Rx', '= 5.1.0'
  pod 'ReSwift', '= 5.0.0'
end

def iLexi_pods
  ui_pods
  flow_pods
end

def core_pods
  ui_pods
  flow_pods
end

target 'iLexi_iOS' do
  project './iLexi.project'
  iLexi_pods
end

target 'Core' do
  project './Core/Core.project'
  core_pods
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
      end
    end
end
