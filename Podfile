platform :ios, '13.0'

inhibit_all_warnings!
use_frameworks!

workspace 'iLexi'

def snapkit
  pod 'SnapKit', '= 5.0.1'
end

def rx_swift
  pod 'RxSwift', '= 5.1.1'
end

def rx_cocoa
  pod 'RxCocoa', '= 5.1.1'
end

def redux
  pod 'ReSwift', '= 5.0.0'
end

def actions_pods
  rx_swift
  redux
end

def use_cases_pods
  rx_swift
  redux
end

def state_pods
  redux
end

def reducers_pods
  redux
end

def observers_pods
  rx_swift
  rx_cocoa
end

def ui_pods
  snapkit
  rx_swift
  rx_cocoa
  redux
  pod 'NSObject+Rx', '= 5.1.0'
end

def iLexi_pods
  ui_pods
end

def core_pods
  ui_pods
end

target 'iLexi_iOS' do
  project './iLexi.project'
  iLexi_pods
end

target 'Core' do
  project './Core/Core.project'
  core_pods
end

target 'Actions' do
  project './Domain/Domain.project'
  actions_pods
end

target 'UseCases' do
  project './Domain/Domain.project'
  use_cases_pods
end

target 'UI' do
  project './Presentation/Presentation.project'
  snapkit
end

target 'UI_iOS' do
  project './Presentation/Presentation.project'
  ui_pods
end

target 'Observers' do
  project './Presentation/Presentation.project'
  observers_pods
end

target 'Observers_iOS' do
  project './Presentation/Presentation.project'
  observers_pods
end

target 'Reducers' do
  project './Presentation/Presentation.project'
  reducers_pods
end

target 'Reducers_iOS' do
  project './Presentation/Presentation.project'
  reducers_pods
end

target 'State_iOS' do
  project './Presentation/Presentation.project'
  redux
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
      end
    end
end
