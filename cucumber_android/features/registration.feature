Feature: User Registration
  I must register user on Pulscen.ru

  Scenario: Success user registration
    Given I click registration
    And I type registration data to textfields
    And I press the registration button
    And Registration text should exists
    Then I take a screenshot with name test

#Feature: Company Registration
 # I must register company on Pulscen.ru

  Scenario: Success company registration
    Given I click registration
    And I type registration data to textfields
    And I press the registration button
    Then I press company registration text
    And I type company registration data to textfields
    And I press company registration button
    Then I take a screenshot with name test1