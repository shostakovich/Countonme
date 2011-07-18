Feature: Show countdowns
  As a visitor of the widget
  I want to see the days and hours remaining
  And I want to see the name off the event
  So I can find out when the event will occur

  Scenario: View the homepage
    Given I am on the homepage
    Then I should see "Create your own countdown"

  Scenario: Create a countdown
    Given I am on the homepage
    And I fill in "Test Countdown" for "description"
    And I fill in "2012-01-01T12:00:01" for "end-date"
    When I press "Generate"
    Then I should be on the widget-code page
    Then I should see "Use this code to embed the countdown"