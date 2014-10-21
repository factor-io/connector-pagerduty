[![Code Climate](https://codeclimate.com/github/factor-io/connector-pagerduty/badges/gpa.svg)](https://codeclimate.com/github/factor-io/connector-pagerduty)
[![Test Coverage](https://codeclimate.com/github/factor-io/connector-pagerduty/badges/coverage.svg)](https://codeclimate.com/github/factor-io/connector-pagerduty)
[![Dependency Status](https://gemnasium.com/factor-io/connector-pagerduty.svg)](https://gemnasium.com/factor-io/connector-pagerduty)
[![Build Status](https://travis-ci.org/factor-io/connector-pagerduty.svg?branch=master)](https://travis-ci.org/factor-io/connector-pagerduty)
[![Gem Version](https://badge.fury.io/rb/factor-connector-pagerduty.svg)](http://badge.fury.io/rb/factor-connector-pagerduty)

PagerDuty Connector for Factor.io
======================

This gem provides PagerDuty actions through the your Factor.io workflow. It was built primarily with the [factor-connector-api](https://github.com/factor-io/connector-api) and [pagerduty](https://github.com/envato/pagerduty) gems.

#Authentication

As an administrative user of [PagerDuty](http://www.pagerduty.com/), you can access your service key by replacing your information in the link below.

`https://<your_subdomain>.pagerduty.com/services`

Your access key can be found in the same way.

`https://<your_subdomain>.pagerduty.com/api_keys`

##Usage

####Incident Actions
• create<br />
• retrieve<br />
• acknowledge<br />
• resolve<br />

####Listener
The listener can be configured to load new incident reports as often as you like.

##Testing

Using a command line to test locally, you must set up three environmental variables:

    $ export PAGERDUTY_SERVICE_KEY=0987654321
    $ export PAGERDUTY_ACCESS_KEY=1234567890
    $ export PAGERDUTY_SUBDOMAIN=dakota-enterprises

Next, you can bundle and run the tests:

    $ bundle install
    $ rake

##Contributing

Documentation, feature requests, code, tests, and bug reports are welcomed. Click [here](https://github.com/factor-io/factor/wiki/Contribution) for more information.
