Given /^I click registration$/ do
  reg_button = text_exact "Зарегистрироваться"
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
  fio = textfield_exact "ФИО"
  full_name = Ryba::Name.full_name.gsub('ё', 'е')
  fio.send_keys full_name
end

Given /^I type random e-mail$/ do
  e_mail = textfield_exact "E-mail"
  random_mail = Faker::Internet.email
  e_mail.send_keys random_mail
end

Given /^I type and confirm random password$/ do
  password = Faker::Internet.password(8)
  pass_field = textfield 3
  pass_field.send_keys password
  confirm_pass_field = textfield 4
  confirm_pass_field.send_keys password
end

Given /^I press the registration button$/ do
  reg_button = button_exact "Зарегистрироваться"
  reg_button.click
  sleep 3
end

Given /^I take a screenshot with name (.*)$/ do |name|
  screenshot "/Users/Andrey/Work/tmp/#{name}.png"
end

Given /^I press company registration text$/ do
  reg_button = text_exact "Зарегистрировать компанию"
  reg_button.click
end

Given /^Registration text should exists$/ do

end

Given /^I choose random element in listview$/ do
  countries = tags "android.widget.CheckedTextView"
  rnd_country = rand(countries.size)
  countries[rnd_country].click
end

Given /^I type company registration data to textfields$/ do
  name = textfield 1
  name.send_keys Ryba::Company.name
  listviews = ["Выберите страну", "Выберите регион", "Выберите город"]
  listviews.each do |x|
    value = button_exact x
    value.click
    step "I choose random element in listview"
  end
  code = textfield_exact "Код"
  number = textfield_exact "Номер телефона"
  code.send_keys Faker::PhoneNumber.subscriber_number(4)
  number.send_keys Faker::PhoneNumber.subscriber_number(6)
  page_class
end

Given /^I press company registration button$/ do
  reg_button = button_exact "Зарегистрировать компанию"
  reg_button.click
end