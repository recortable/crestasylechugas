class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :pendings
  has_many :clips, :through => :pendings, :order => 'id desc'

  COLORS = [['verde', '#58DF37'], ['violeta', '#923BEF'], ['gris', '#CFCFCF'], ['cyan', '#86EFCF'], ['amarillo', '#FFE900']]

end
