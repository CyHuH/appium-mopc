Feature: Products search
  I must search a product and open it

  Scenario: Product search
    Given I type search query Tovar and press enter button
    And I tap on product from products list
    And I must see product screen with some information
    Then I take a screenshot with name test2