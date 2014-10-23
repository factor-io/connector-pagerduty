require 'factor-connector-api'
require 'pagerduty'
require 'httparty'

Factor::Connector.service 'pagerduty' do
  action 'create' do |params|

    service_key = params['service_key']
    description = params['description']
    incident_key = params['incident_key']
    client = params['client']
    client_url = params['client_url']

    fail 'A description is required' unless description
    fail 'A Service Key (service_key) must be provided' unless service_key

    content = {
      incident_key: incident_key,
      client: client,
      client_url: client_url
    }

    info 'Generating a new incident'
    begin
      service = Pagerduty.new(service_key)
      incident = service.trigger(description, content)
    rescue
      fail 'Failed to send incident'
    end
    action_callback incident
  end

  action 'retrieve' do |params|

    service_key = params['service_key']
    incident_key = params['incident_key']

    fail 'A Service Key (service_key) must be provided' unless service_key
    fail 'An incident key is required' unless incident_key

    info 'Retrieving the incident information'
    begin
      service = Pagerduty.new(service_key)
      incident = service.get_incident(incident_key)
    rescue
      fail 'Failed to find the incident'
    end
    action_callback incident
  end

  action 'acknowledge' do |params|

    service_key = params['service_key']
    incident_key = params['incident_key']

    fail 'A Service Key (service_key) must be provided' unless service_key
    fail 'An incident key is required' unless incident_key

    info 'Acknowledging the incident'
    begin
      service = Pagerduty.new(service_key)
      incident = service.get_incident(incident_key)
      response = incident.acknowledge
    rescue
      fail 'Failed to find the incident'
    end
    action_callback response
  end

  action 'resolve' do |params|

    service_key = params['service_key']
    incident_key = params['incident_key']

    fail 'A Service Key (service_key) must be provided' unless service_key
    fail 'An incident key is required' unless incident_key

    info 'Resolving the incident'
    begin
      service = Pagerduty.new(service_key)
      incident = service.get_incident(incident_key)
      response = incident.resolve
    rescue
      fail 'Failed to find the incident'
    end
    action_callback response
  end

  action 'list' do |params|

    subdomain = params['subdomain']
    access_key = params['access_key']

    fail 'A subdomain must be provided' unless subdomain
    fail 'An Access Key (access_key) is required' unless access_key

    info 'Loading incidents'
    begin
      uri = "https://#{subdomain}.pagerduty.com/api/v1/incidents"
      access_string = "Token token=#{access_key}"
      response = HTTParty.get(
        uri,
        headers: {
          'Content-Type' => 'application/json', 'Authorization' => access_string
        }
      )
    rescue
      fail 'Failed to load incidents'
    end

    info 'Parsing the response'
    begin
      incident_list = JSON.parse(response.body)
    rescue
      fail 'Failed to parse the response from the PagerDuty API'
    end

    action_callback incident_list
  end
end
