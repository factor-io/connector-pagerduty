require 'spec_helper'

describe 'PagerDuty' do
  describe 'incident' do
    it 'can generate an incident' do

      service_key = ENV['PAGERDUTY_SERVICE_KEY']
      description = 'Test'

      service_instance = service_instance('pagerduty')

      params = {
        'service_key' => service_key,
        'description' => description,
      }

      service_instance.test_action('incident', params) do
        expect_info message: 'Beginning authentication'
        expect_info message: 'Generating a new incident'
        expect_return
      end
    end
  end
end
