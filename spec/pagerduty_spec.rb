require 'spec_helper'

describe 'PagerDuty' do
  describe 'incident' do
    it 'can generate an incident' do

      service_key = @service_key
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
        expect_info message: 'Generating a new incident'
        expect_return
      end
    end

    it 'can find an incident' do

      service_key = @service_key
      incident_key = @incident.incident_key

      service_instance = service_instance('pagerduty')

      params = {
        'service_key' => service_key,
        'incident_key' => incident_key
      }

      service_instance.test_action('retrieve-incident', params) do
        expect_info message: 'Retrieving the incident information'
        expect_return
      end
    end

    it 'can acknowledge an incident' do

      service_key = @service_key
      incident_key = @incident.incident_key

      service_instance = service_instance('pagerduty')

      params = {
        'service_key' => service_key,
        'incident_key' => incident_key
      }

      service_instance.test_action('acknowledge-incident', params) do
        expect_info message: 'Acknowleding the incident'
        expect_return
      end
    end

    it 'can resolve an incident' do

      service_key = @service_key
      incident_key = @incident.incident_key

      service_instance = service_instance('pagerduty')

      params = {
        'service_key' => service_key,
        'incident_key' => incident_key
      }

      service_instance.test_action('resolve-incident', params) do
        expect_info message: 'Resolving the incident'
        expect_return
      end
    end
  end
end
