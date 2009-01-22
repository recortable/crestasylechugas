class User < ActiveRecord::Base
  has_and_belongs_to_many :groups

  COLORS = [['verde', '#58DF37'], ['violeta', '#923BEF'], ['gris', '#CFCFCF'], ['amarillo', '#FFE900']]

  def clips
    
  end
end
