class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string 'name'
      t.string 'email'
      t.string 'pass'
      t.string 'movil'
      t.string 'fijo'
      t.boolean 'admin', :default => false
      t.boolean 'active', :default => true
      t.timestamp 'access'
      t.timestamps
    end

    User.create(:name => 'Jorge', :email => 'jorge', 
      :pass => 'jorge', :admin => 'true')
    User.create(:name => 'Paelo', :email => 'paelo', 
      :pass => 'paelo', :admin => 'true')
    User.create(:name => 'Dani', :email => 'dani', 
      :pass => 'dani', :admin => 'true',
      :movil => '661913226', :fijo => '954916069')
    User.create(:name => 'Cris', :email => 'cris', :pass => 'cris')
  end

  def self.down
    drop_table :users
  end
end
