require 'spec_helper'

describe 'PagerDuty' do
  describe 'incident' do
    it 'can generate an incident' do

      service_key = ENV['PAGERDUTY_SERVICE_KEY']
      description = 'CRITICAL'
      incident_key = '502'
      client = 'The servers are overloaded.'
      client_url = 'http://www.checkupdown.com/status/E503.html'

      service_instance = service_instance('pagerduty')

      params = {
        'service_key' => service_key,
        'description' => description,
        'incident_key' => incident_key,
        'client' => client,
        'client_url' => client_url
      }

      service_instance.test_action('incident', params) do
        expect_info message: 'Beginning authentication'
        expect_info message: 'Generating a new incident'
        expect_return
      end
    end
  end
end
