require_relative '../pages/authorization'
require_relative '../pages/registration'
World(AuthorizationWorld, RegistrationWorld)

DEFAULT_DATA = { :full_name => Ryba::Name.full_name.gsub(/['Ё''ё']/, 'е'),
         :user_email => Faker::Internet.email,
         :user_password => Faker::Internet.password(8),
         :company_name => Ryba::Company.name }


Given /^I open registration screen$/ do
  login_button.click
  reg_button.click
end

Given /^I type registration data to textfields$/ do  
  steps %Q{
    Given I type random name
    Given I type random e-mail
    Given I type and confirm random password
  }
end

Given /^I type random name$/ do
  fio_field.type DEFAULT_DATA[:full_name]
end

Given /^I type random e-mail$/ do
  email_field.type DEFAULT_DATA[:user_email]
end

Given /^I type and confirm random password$/ do
  pass_field.type DEFAULT_DATA[:user_password]
end

Given /^I press the registration button$/ do
  reg_button.click
  sleep 3
end

Given /^I go to cabinet$/ do
  cabinet_button.click
end

Given /^I press add company$/ do
  add_company.click
end

Given /^Registration text should exists$/ do

end

Given /^I choose random element in listview$/ do
  countries = texts
  rnd_country = rand(1..countries.size)
  countries[rnd_country].click
end

Given /^I type company registration data to textfields$/ do
  name = textfield 1
  name.type DEFAULT_DATA[:company_name]
  listviews = ["Страна", "Регион", "Город"]
  listviews.each do |x|
    value = text_exact x
    value.click
    step "I choose random element in listview"
  end
  code = textfields[2]
  number = textfields[3]
  code.type Faker::PhoneNumber.subscriber_number(4)
  number.type Faker::PhoneNumber.subscriber_number(6)
end