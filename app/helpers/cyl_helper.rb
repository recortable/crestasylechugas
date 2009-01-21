module CylHelper

  def calendar_action(cal, month_offset)
    month = cal[:month]
    year = cal[:year]
    month += month_offset
    if month < 1
      year -= 1
      month = 12
    elsif month > 12
      year += 1
      month = 1
    end
    {:action => 'calendar', :month => month, :year => year}
  end
end
