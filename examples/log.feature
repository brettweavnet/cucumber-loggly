Feature: example searches
  Examples of searching 

  Scenario: Event occured minimum # of times
    When I access account default
    And I include query status=success
    And I search back 24 hours
    Then I should find at least 1 occurance

  Scenario: Event occured no more than given # of times
    When I access account default
    And I include input app-syslog
    And I search back 30 minutes
    And I include query success
    Then I should find less than 5 occurances

  Scenario: Event has not occured
    When I access account default
    And I include query failed
    And I search back 72 hours
    Then I should find no occurances
