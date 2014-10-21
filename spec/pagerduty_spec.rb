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

      service_instance.test_action('create', params) do
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

      service_instance.test_action('retrieve', params) do
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

      service_instance.test_action('acknowledge', params) do
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

      service_instance.test_action('resolve', params) do
        expect_info message: 'Resolving the incident'
        expect_return
      end
    end

    it 'can listen for incidents' do

      subdomain = @subdomain
      access_key = @access_key

      service_instance = service_instance('pagerduty')

      params = {
        'subdomain' => subdomain,
        'access_key' => access_key
      }

      service_instance.test_action('list', params) do
        expect_info message: 'Loading incidents'
        expect_info message: 'Parsing the response'
        expect_return
      end
    end
  end
end
