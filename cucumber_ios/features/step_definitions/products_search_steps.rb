require_relative '../pages/home'

World(HomeWorld)

Given /^I type search query (.*) and press enter button$/ do |product_name|
  search_field = ele_index("UIASearchBar", 1)
  search_field.send_keys product_name
  search_field.send_keys "\n"
end

Then(/^I select product №(\d+) from products list$/) do |x|
  wait{ product_on_list(x).click }
  @num = x
end

Given(/^Product name from chosen product should be equal product name from card$/) do
  expect(product_on_list(@num).text).to eq(product_name_on_card.text)
end

Given(/^I swipe products list (\d+) times$/) do |x|
  swipe_up_count(x)
end

Then(/^Element №(\d+) should exist$/) do |x|
  expect(exists { wait { product_on_list(x) } } ).to be true
end

Then(/^I take a screenshot with name (.*)$/) do |name|
  screenshot "/Users/Andrey/Work/tmp/#{name}.png"
end