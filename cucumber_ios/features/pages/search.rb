module SearchWorld
  def search_field
    tag "UIASearchBar"
  end

  def search_button
    button_exact "Поиск"
  end

  def categories_search
    wait { first_ele("UIATableCell") }
  end

  def all_vendor_products
    text("Все предложения компании")
  end

  def product_click
    xpath("//UIATableView[1]/UIATableCell[3]/UIAStaticText[1]").click
  end

  def product_name_on_card
    xpath("//UIATableView[2]/UIATableCell[1]/UIATextView[1]")
  end

  def product_on_list(n)
    xpath("//UIATableView[1]/UIATableCell[#{n}]/UIAStaticText[1]")
  end

  def swipe_left_side(n)
    swipe_opts = { :start_x => 100,
                   :start_y => 700,
                   :end_x => 100,
                   :end_y => 200,
                   :duration => 500 }
    n.to_i.times { wait{ swipe(swipe_opts) } }
  end

  def swipe_right_side(n)
    swipe_opts = { :start_x => 700,
                   :start_y => 600,
                   :end_x => 700,
                   :end_y => 200,
                   :duration => 500 }
    n.to_i.times { wait{ swipe(swipe_opts) } }
  end

  def tap_rnd_category
    categories = tags("UIATableCell")
    x = categories.size + 1
    categories[rand(x)].click
  end

  def tap_rnd_suggestion
    suggestions = xpaths("//UIATableView[1]/UIATableCell[@*]/UIAStaticText[@*]")
    x = suggestions.size + 1
    suggestions[rand(x)].click
  end
end