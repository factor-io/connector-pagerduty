require 'factor-connector-api'
require 'pagerduty'

Factor::Connector.service 'pagerduty' do
  action 'incident' do |params|

    service_key = params['service_key']
    description = params['description']
    incident_key = params['incident_key']
    client = params['client']
    client_url = params['client_url']

    fail 'Description is required' unless description
    fail 'A service key must be provided' unless service_key

    info 'Beginning authentication'
    begin
      service = Pagerduty.new(service_key)
    rescue
      fail 'Authentication failed'
    end

    content = {
      incident_key: incident_key,
      client: client,
      client_url: client_url
    }

    info 'Generating a new incident'
    begin
      response = service.trigger(description, content)
    rescue
      fail 'Failed to send incident'
    end
    action_callback response
  end
end
