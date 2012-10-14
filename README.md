[![Build Status](https://secure.travis-ci.org/brettweavnet/cucumber-loggly.png)](http://travis-ci.org/brettweavnet/cucumber-loggly)

Run cucumber specs to ensure events are checked.

## Installation

```
gem install cucumber-loggly
```

## Getting Started

Create the config file.

```
cat > ~/.cucumber-loggly.yml << EOF
default:
  username: your_username
  password: your_password
EOF
```

Create a feature filem, for example:

```
cat > ~/example.feature << EOF
Feature: example searches
  Examples of searching

  Scenario: Event occured minimum # of times
    When I access loggly account default
    And I include query status=success
    And I search back 24 hours
    Then I should find at least 1 occurance

  Scenario: Event occured no more than given # of times
    When I access loggly account default
    And I include input app-syslog
    And I search back 30 minutes
    And I include query success
    Then I should find less than 5 occurances

  Scenario: Event has not occured
    When I access loggly account default
    And I include input app-http-1
    And I include input app-http-2
    And I include query failed
    And I include query 500
    And I search back 72 hours
    Then I should find no occurances
EOF
```

Run cucumber loggly against features:

```
cucumber-loggly ~/example.feature
```

Multiple queries will be ANDed together.

Multiple inputs will be ORed together.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
