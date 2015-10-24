DEFAULT_DATA = { :full_name => Ryba::Name.full_name.gsub(/['Ё''ё']/, 'е'),
         :user_email => Faker::Internet.email,
         :user_password => Faker::Internet.password(8),
         :company_name => Ryba::Company.name }


Given /^I click registration$/ do
  enter_button = button_exact "Войти"
  enter_button.click
  reg_button = button_exact "Зарегистрироваться"
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
  fio.send_keys DEFAULT_DATA[:full_name]
end

Given /^I type random e-mail$/ do
  e_mail = textfield_exact "Email"
  e_mail.send_keys DEFAULT_DATA[:user_email]
end

Given /^I type and confirm random password$/ do
  pass_field = textfield 3
  pass_field.send_keys DEFAULT_DATA[:user_password]
  confirm_pass_field = textfield 4
  confirm_pass_field.send_keys DEFAULT_DATA[:user_password]
end

Given /^I press the registration button$/ do
  reg_button = button_exact "Готово"
  reg_button.click
  sleep 3
end

Given /^I go to Settings$/ do
  settings = button_exact "Настройки"
  settings.click
end

Given /^I press company registration text$/ do
  company_choice = text_exact "Выбор компании"
  company_choice.click
  #Илья создал непонятный элемент, придется тапать по координатам
  execute_script 'mobile: tap', :x => 537, :y => 292
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
  name.send_keys DEFAULT_DATA[:company_name]
  listviews = ["Страна", "Регион", "Город"]
  listviews.each do |x|
    value = text_exact x
    value.click
    step "I choose random element in listview"
  end
  code = textfields[2]
  number = textfields[3]
  code.send_keys Faker::PhoneNumber.subscriber_number(4)
  number.send_keys Faker::PhoneNumber.subscriber_number(6)
end

Given /^Logout$/ do
  #Если авторизованы, то сообщения доступны
  if exists { button_exact "Сообщения" } then
    step "I go to Settings"
    logout_button = text_exact "Выйти"
    logout_button.click
    alert_accept
  end
end