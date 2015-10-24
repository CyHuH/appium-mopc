require_relative '../pages/search'

World(SearchWorld)

Given /^I type search query (.*)$/ do |product_name|
  @search_field = ele_index("UIASearchBar", 1)
  @search_field.send_keys product_name
end

Given(/^Press enter button$/) do
  @search_field.send_keys "\n"
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

Given(/^Tap on categories search element$/) do
  categories_search = wait { first_ele("UIATableCell") }
  categories_search.click
end

Then(/^I select random third level category from list$/) do
  3.times { wait {tap_rnd_category} }
end

Given(/^I tap on random search suggestion$/) do
  wait { tap_rnd_suggestion }
end

Then (/^I tap on all vendor products$/) do
  all_vendor_products = text("Все предложения поставщика")
  all_vendor_products.click
end

Then (/^Company name should be equal company name in listing$/) do
  company_name = xpath("//UIAApplication[1]/UIAWindow[1]/UIANavigationBar[2]/UIAStaticText[1]")
  company_name_in_listing = xpath("//UIAApplication[1]/UIAWindow[1]/UIATableView[2]/UIATableCell[1]/UIAStaticText[4]")
  expect(company_name.text).to eq(company_name_in_listing.text)
end

Given(/^Hard reset$/) do
  reset
end