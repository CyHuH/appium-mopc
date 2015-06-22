Given /^I type search query (.*) and press enter button$/ do |product|
  page_class
  search_field = first_textfield
  search_field.send_keys product
  search_field.click
  press_keycode 66, 16
  sleep 5
end

Given(/^I tap on product from products list$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I must see product screen with some information$/) do
  pending # express the regexp above with the code you wish you had
end