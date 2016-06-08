Feature: Orders
  I create an order

  Scenario: Authorize with client and create an order
    Given Close region popup if exists
    Given Logout
    Given Login with client
    Given Open search screen
    Given Search for Tovar
    And I click an order button
    And I fill order fields
    Then I click send order button
    And I go to my orders screen
    Then New order should exist
    And All fields should be the same

  Scenario: Authorize with seller and check an order
    Given Close region popup if exists
    Given Logout
    And Login with seller
    Then I go to orders screen
    And New order should exist
    And All fields should be the same