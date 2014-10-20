require 'factor-connector-api'
require 'pagerduty'

Factor::Connector.service 'pagerduty' do
  action 'incident' do |params|

    service_key = params['service_key']
    description = params['description']
    incident_key = params['incident_key']
    client = params['client']
    client_url = params['client_url']

    fail 'A description is required' unless description
    fail 'A service key must be provided' unless service_key

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

  action 'retrieve-incident' do |params|

    service_key = params['service_key']
    incident_key = params['incident_key']

    fail 'A service key must be provided' unless service_key
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

  action 'acknowledge-incident' do |params|

    service_key = params['service_key']
    incident_key = params['incident_key']

    fail 'A service key must be provided' unless service_key
    fail 'An incident key is required' unless incident_key

    info 'Acknowleding the incident'
    begin
      service = Pagerduty.new(service_key)
      incident = service.get_incident(incident_key)
      response = incident.acknowledge
    rescue
      fail 'Failed to find the incident'
    end
    action_callback response
  end

  action 'resolve-incident' do |params|

    service_key = params['service_key']
    incident_key = params['incident_key']

    fail 'A service key must be provided' unless service_key
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
end
