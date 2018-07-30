module ApplicationHelper

  def display_currency(value)
    number_to_currency(value, precision: 2)
  end

  def integer_check(string)
     /\A[-+]?\d+\z/ === string
  end

end
