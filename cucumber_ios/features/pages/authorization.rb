module AuthorizationWorld
  def region_popup_close_button
    button_exact "cancel"
  end

  def login_button
    button_exact "Войти"
  end

  def logout_button
    button_exact "Выйти"
  end

  def email_field
    fields = textfields
    textfields[0]
  end

  def password_field
    textfield_exact "Пароль"
  end

  def order_button
    button_exact "Заказать"
  end

  def measure_unit_cell
    text_exact "Единица измерения"
  end

  def country_cell
    text_exact "Страна"
  end

  def region_cell
    text_exact "Регион"
  end

  def send_order_button
    button_exact "Отправить заказ"
  end

  def orders_screen_button
    button_exact "Заказы"
  end

  def disclosure_down
    button_exact "disclosure down"
  end

  def my_orders
    text_exact "Мои заказы"
  end

  def cabinet_button
    button_exact "Кабинет"    
  end

  def keyboard_hide_hack
    # Клавиатура не скрывается штатными средствами, поэтому костыль
    execute_script 'mobile: tap', :x => 1000, :y => 700
  end
end