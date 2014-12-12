class Registration
  def initialize
    
  end
  
  def fill_fio full_name
    fio = textfield_exact "ФИО"
    fio.send_keys full_name
  end
  
  def fill_email random_mail
    e_mail = textfield_exact "E-mail"
    e_mßail.send_keys random_mail
  end

  def fill_password password
    pass_field = textfield 3
    pass_field.send_keys password
    confirm_pass_field = textfield 4
    confirm_pass_field.send_keys password
  end
end