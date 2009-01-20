class Document < ActiveRecord::Base
  DIALECTS = [:plain, :html, :textile]

  def summary
    "<h1>#{title}</h1>#{body}"
  end
end
