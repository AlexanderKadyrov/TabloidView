Pod::Spec.new do |s|
  
  s.name                   = 'TabloidView'
  s.module_name            = 'TabloidView'
  s.summary                = 'TabloidView'
  s.description            = 'TabloidView'
  s.version                = '1.0.9'

  s.homepage               = 'https://github.com/AlexanderKadyrov/TabloidView'
  s.author                 = { 'Alexander Kadyrov' => 'alexander-kad@yandex.ru' }
  s.source                 = { :git => 'https://github.com/AlexanderKadyrov/TabloidView.git', :tag => s.version }
  
  s.source_files           = 'TabloidView/Sources/**/*.{h,swift}'

  s.tvos.deployment_target = '9.0'
  s.ios.deployment_target  = '9.0'
  s.swift_version          = '5.0'

  s.license                = { :type => 'MIT', :file => 'LICENSE.md' }
  
  s.dependency 'ReactiveCocoa'

  s.requires_arc = true

end