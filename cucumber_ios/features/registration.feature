Feature: Registration
  I must register user and company

  Scenario: Success user registration
    Given Logout
    Given I click registration
    And I type registration data to textfields
    And I press the registration button
    And Registration text should exists
    Then I take a screenshot with name test

  Scenario: Success company registration
    Given I go to Settings
    Then I press company registration text
    And I type company registration data to textfields
    And I press the registration button
    Then I take a screenshot with name test1