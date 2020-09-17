platform :ios, '13.0'

use_frameworks!

workspace 'iLexi'

def ui_pods
  pod 'SnapKit', '= 5.0.1'
end

def flow_pods
  pod 'RxSwift', '= 5.1.1'
  pod 'ReSwift', '= 5.0.0'
end

def iLexi_pods
  ui_pods
  flow_pods
end

target 'iLexi_iOS' do
  project './iLexi.project'
  iLexi_pods
end
