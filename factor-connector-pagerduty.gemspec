# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'factor-connector-pagerduty'
  s.version       = '0.0.2'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Josie Wright']
  s.email         = ['jozwright@gmail.com']
  s.homepage      = 'https://factor.io'
  s.summary       = 'PagerDuty Factor.io Connector'
  s.files         = ['lib/factor/connector/pagerduty.rb']

  s.require_paths = ['lib']

  s.add_runtime_dependency 'factor-connector-api', '~> 0.0.3'
  s.add_runtime_dependency 'pagerduty', '~> 2.0.0'
  s.add_runtime_dependency 'httparty', '~> 0.13.1'

  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.1'
  s.add_development_dependency 'rspec', '~> 3.1.0'
  s.add_development_dependency 'rake', '~> 10.4.2'
end
