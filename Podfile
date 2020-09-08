platform :ios, '13.0'

use_frameworks!

workspace 'iLexi'

def core_pods
    # Rx
    pod 'RxSwift', '~> 5'
end

def iLexi_pods
    core_pods
end

target 'iLexi' do
  project './iLexi.project'
  iLexi_pods
end
