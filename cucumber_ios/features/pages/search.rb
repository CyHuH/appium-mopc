module SearchWorld
  def product_click
    xpath("//UIATableView[1]/UIATableCell[3]/UIAStaticText[1]").click
  end

  def product_name_on_card
    xpath("//UIATableView[2]/UIATableCell[1]/UIATextView[1]")
  end

  def product_on_list(n)
    xpath("//UIATableView[1]/UIATableCell[#{n}]/UIAStaticText[1]")
  end

  def swipe_up_count(n)
    swipe_opts = { :start_x => 100,
                   :start_y => 700,
                   :end_x => 100,
                   :end_y => 200,
                   :duration => 500 }
    n.to_i.times { wait{ swipe(swipe_opts) } }
  end

  def tap_rnd_category
    categories = tags("UIATableCell")
    x = categories.size + 1
    categories[rand(x)].click
  end
end