class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string 'name'
      t.string 'email'
      t.string 'pass'
      t.timestamp 'access'
      t.timestamps
    end

    User.create(:name => 'jorge', :email => 'jorge@cyl.com')
    User.create(:name => 'paelo', :email => 'paelo@cyl.com')
    User.create(:name => 'dani', :email => 'danigb@cyl.com')
  end

  def self.down
    drop_table :users
  end
end
