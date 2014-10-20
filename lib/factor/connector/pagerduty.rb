require 'factor-connector-api'
require 'pagerduty'

Factor::Connector.service 'pagerduty' do
  action 'incident' do |params|

    service_key = params['service_key']
    description = params['description']

    fail 'Description is required' unless description
    fail 'A service key must be provided' unless service_key

    info 'Beginning authentication'
    begin
      service = Pagerduty.new(service_key)
    rescue
      fail 'Authentication failed'
    end

    info 'Generating a new incident'
    begin
      response = service.trigger(description)
    rescue
      fail 'Failed to send incident'
    end
    action_callback response
  end
end