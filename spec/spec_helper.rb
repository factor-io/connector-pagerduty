require 'codeclimate-test-reporter'
require 'rspec'
require 'wrong'
require 'factor-connector-api/test'
require 'pagerduty'

CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

Dir.glob('./lib/factor/connector/*.rb').each { |f| require f }

RSpec.configure do |c|
  c.include Factor::Connector::Test

  c.before do
    @service_key = ENV['PAGERDUTY_SERVICE_KEY']
    @service = Pagerduty.new(@service_key)
    @incident = @service.trigger('Test', incident_key: '101')
  end

  c.after do
    @incident.resolve
  end
end
