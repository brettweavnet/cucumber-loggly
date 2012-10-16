[![Build Status](https://secure.travis-ci.org/brettweavnet/cucumber-loggly.png)](http://travis-ci.org/brettweavnet/cucumber-loggly)

Write [Cucumber](http://cukes.info) features to ensure presence or lack of events based on results of Loggly search.

## Installation

```
gem install cucumber-loggly
```

## Getting Started

Create the config file:

```
default:
  username: your_username
  password: your_password
```

Create a feature file, for example:

```
Feature: example searches
  Examples of searching

  Scenario: Event occured minimum # of times
    When I access loggly account default
    And I include query status=success
    And I search back 24 hours
    Then I should find at least 1 occurrence
```

Run cucumber loggly against features:

```
cucumber-loggly ~/example.feature
```

Review the results:

```
# cucumber-loggly ~/example.feature
Feature: example searches
  Examples of searching

  Scenario: Event occured minimum # of times # /Users/me/example.feature:4
    When I access loggly account default     # cucumber-loggly-0.1.1/lib/cucumber-loggly/steps.rb:1
    And I include query status=success       # cucumber-loggly-0.1.1/lib/cucumber-loggly/steps.rb:13
    And I search back 24 hours               # cucumber-loggly-0.1.1/lib/cucumber-loggly/steps.rb:5
    Then I should find at least 1 occurrence # cucumber-loggly-0.1.1/lib/cucumber-loggly/steps.rb:17

1 scenario (1 passed)
4 steps (4 passed)
0m0.976s
```

Get more advanced:

```
Feature: example searches
  Examples of searching

  Scenario: Event occured minimum # of times
    When I access loggly account default
    And I include query status=success
    And I search back 24 hours
    Then I should find at least 1 occurrence

  Scenario: Event occured no more than given # of times
    When I access loggly account default
    And I include input app-syslog
    And I search back 30 minutes
    And I include query success
    Then I should find less than 5 occurrences

  Scenario: Event has not occured
    When I access loggly account default
    And I include input app-http-1
    And I include input app-http-2
    And I include query failed
    And I include query 500
    And I search back 72 hours
    Then I should find no occurrences
```

Multiple query includes will be joined with **AND**.

Multiple input includes will be joined with **OR**.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
