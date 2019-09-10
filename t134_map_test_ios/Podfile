# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

flutter_application_path = '/Users/raja/Downloads/exmaple_flutter/flutter_module/'

target 'SampleiOSFlutter' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

    eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)

    
    pre_install do |installer|
      # workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
      Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
    end


  # Pods for SampleiOSFlutter

  target 'SampleiOSFlutterTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SampleiOSFlutterUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
