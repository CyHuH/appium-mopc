Feature: Products search
  I must search a product and open it

  Scenario: Product search
    Given I type search query Товар and press enter button
    Then I select product №3 from products list
    And Product name from chosen product should be equal product name from card
    Then I swipe products list 4 times
    Then Element №17 should exist
    Then I take a screenshot with name test2