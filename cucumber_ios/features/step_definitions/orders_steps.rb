require_relative '../pages/search'
require_relative '../pages/authorization'
World(AuthorizationWorld, SearchWorld)

CLIENT_DATA = { :login => "test.mopc@gmail.com",
                :password => "testmopc",
                :phone_number => "9521331837" }

SELLER_DATA = { :login => "malykh@ek.apress.ru",
                :password => "12131415" }

Given /^Close region popup if exists$/ do
  if exists { region_popup_close_button } then
      region_popup_close_button.click
  end
end

Given /^Login with client$/ do
  wait { login_button.click }
  email_field.clear
  email_field.type CLIENT_DATA[:login]
  password_field.type CLIENT_DATA[:password]
  login_button.click
end

Given /^Open search screen$/ do
  wait { search_button.click }
end

Given /^Search for Tovar$/ do
  steps %Q{
    Given I type search query Tovar
    And Press enter button
  }
end

And /^I click an order button$/ do
  wait { order_button.click }
end

Given /^Choose quantity$/ do
  @fields_array = textfields
  @rnd_quantity = rand(1..1000)
  @fields_array[0].clear
  @fields_array[0].type @rnd_quantity
  keyboard_hide_hack
end

Given /^Choose random measure unit$/ do
  measure_unit_cell.click
  array = tags "UIATableCell"
  len = array.length - 1
  chosen_one = rand(1..len)
  @measure_unit = array[chosen_one].name
  array[chosen_one].click
end

And /^Type the phone number$/ do
  phone_field = textfields[1]
  phone_field.send_keys CLIENT_DATA[:phone_number]
  keyboard_hide_hack
end

Given /^Сhoose country$/ do
  wait { country_cell.click }
  array = tags "UIATableCell"
  len = array.length - 1
  chosen_one = rand(1..len)
  @country = array[chosen_one].name
  array[chosen_one].click
end

And /^Choose region$/ do
  wait { region_cell.click }
  array = tags "UIATableCell"
  len = array.length - 1
  chosen_one = rand(1..len)
  @region = array[chosen_one].name
  array[chosen_one].click
end

And /^I fill order fields$/ do
  steps %Q{
    Given Choose random measure unit
    Given Сhoose country
    And Choose region
    And Type the phone number
    Given Choose quantity
  }
end

Then /^I click send order button$/ do
  wait { send_order_button.click }
end

And /^I go to my orders screen$/ do
  steps %Q{
    Given Open orders screen
    And Open My orders screen
  }
end

Given /^Open orders screen$/ do
  wait { orders_screen_button.click }
end

Given /^Open My orders screen$/ do
  wait { disclosure_down.click }
  my_orders.click
end

Then /^New order should exist$/ do
  
end

And /^All fields should be the same$/ do
  
end

Then /^Logout$/ do
  if exists { cabinet_button } then
    cabinet_button.click
    logout_button.click
  end
end

And /^Login with seller$/ do
  wait { login_button.click }
  email_field.clear
  email_field.type SELLER_DATA[:login]
  password_field.type SELLER_DATA[:password]
  login_button.click
end

Then /^I go to orders screen$/ do
    
end