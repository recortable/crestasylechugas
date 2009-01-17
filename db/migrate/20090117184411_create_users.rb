class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string 'name'
      t.string 'email'
      t.string 'pass'
      t.timestamp 'access'
      t.timestamps
    end

    User.create(:name => 'Jorge', :email => 'jorge@cyl.com', :pass => 'jorge')
    User.create(:name => 'Paelo', :email => 'paelo@cyl.com', :pass => 'paelo')
    User.create(:name => 'Dani', :email => 'danigb@cyl.com', :pass => 'dani')
  end

  def self.down
    drop_table :users
  end
end
