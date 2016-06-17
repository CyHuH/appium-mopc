module RegistrationWorld
  def reg_button
    button_exact "Зарегистрироваться"
  end

  def fio_field
    textfield_exact "ФИО"
  end

  def email_field
    textfield_exact "Email"
  end

  def pass_field
    textfield 3
  end

  def add_company
    text_exact "Добавить компанию"
  end
end