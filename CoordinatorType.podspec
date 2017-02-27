Pod::Spec.new do |s|
  
  s.name         = "CoordinatorType"
  s.version      = "0.0.1"
  s.summary      = "CoordinatorType protocol for making implementing the Coordinator pattern painless."
  s.description  = <<-DESC
  CoordinatorType protocol with basic Coordinator requirements implemented and default functionality implemented via protocol extensions.
                   DESC
  s.homepage     = "https://github.com/rchatham/CoordinatorType.git"
  s.license      = "MIT"
  s.author             = { "Reid Chatham" => "reid.chatham@gmail.com" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source       = { :git => "https://github.com/rchatham/CoordinatorType.git", :tag => "#{s.version}" }

  spec.ios.source_files   = 'CoordinatorType-iOS/*.swift'
  spec.osx.source_files   = 'CoordinatorType-macOS/*.swift'

end
