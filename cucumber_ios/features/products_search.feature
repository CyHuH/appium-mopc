Feature: Products search
  I must search a product and open it
    
  Background: Steps before each scenarios
    Given Hard reset
    Given Close region popup if exists
    Given Logout

  Scenario: Product search
    Given I type search query Товар
    And Press enter button
    Then I select product №3 from products list
    And Product name from chosen product should be equal product name from card
    Then I swipe products list 4 times
    Then Element №11 should exist
    Then I take a screenshot with name test2

  Scenario: Search in categories
    Then Tap on categories search element
    Then I select random third level category from list
    And I select product №5 from products list
    Then Product name from chosen product should be equal product name from card
    And I swipe products list 4 times
    Then Element №17 should exist
    And I take a screenshot with name test3

  Scenario: Search suggestions
    Given I type search query Труба
    And I tap on random search suggestion
    Then Element №2 should exist
    Then I select product №2 from products list
    And Product name from chosen product should be equal product name from card

  Scenario: All vendor products
    Given I type search query Труба
    And Press enter button
    And I select product №3 from products list
    Then I tap on all vendor products
    Then Company name should be equal company name in listing