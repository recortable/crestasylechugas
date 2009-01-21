
module MonthlyHelper

  SHORT_DAY_NAMES = ['D','L', 'M', 'X', 'J', 'V','S']
  DAY_NAMES = %w(domingo lunes martes miércoles jueves viernes sábado)

  MES = %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre)

  def mes(number)
    MES[number - 1]
  end

  def monthly(options = {}, &block)

    block ||= Proc.new {|date| date.day}
    today = Date.today
    defaults = {
      :year => today.year,
      :month => today.mon,
      :first_day_of_week => 1,
      :table_class => 'calendar',
      :day_names => MonthlyHelper::DAY_NAMES
    }
    options = defaults.merge options

    month_start = Date.civil(options[:year], options[:month], 1)
    month_end  = Date.civil(options[:year], options[:month], -1)
    first_weekday = options[:first_day_of_week]
    first_day = month_start - (month_start.wday - first_weekday).days
    last_day = month_end + (6 - month_end.wday + options[:first_day_of_week]).days
    total_weeks =  (last_day - first_day + 1).to_i / 7

    day_names = options[:day_names].dup
    first_weekday.times do
      day_names.push(day_names.shift)
    end

    current = first_day

    concat %(<table class="#{options[:table_class]}">)
    concat %(<tr class="names")
    day_names.each {|name| concat %(<td>#{name}</td>)}
    concat %(</tr>)
    total_weeks.times do
      concat %(<tr">)
      0.upto(6) do
        tdc = (today.month == current.month && current.day == today.day) ? 'today' : ''
        concat %(<td class="#{tdc}">#{capture(options[:month], current, &block)}</td>)
        current += 1.day
      end
      concat %(</tr>)
    end
  end




end