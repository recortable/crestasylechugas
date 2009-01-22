class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :pendings
  has_many :clips, :through => :pendings

  COLORS = [['verde', '#58DF37'], ['violeta', '#923BEF'], ['gris', '#CFCFCF'], ['amarillo', '#FFE900']]

end
