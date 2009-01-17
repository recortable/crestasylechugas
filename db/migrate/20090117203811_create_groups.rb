class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :groups_users, :id => false do |t|
      t.references :group
      t.references :user
    end

    cyl = Group.new(:name => 'cyl')
    cyl.users << User.find(:all)
    cyl.save

    ci = Group.create(:name => 'comisión técnica', :description => 'se encarga de todas las labores guapas guapas de la hüerta')
    ci.users << User.find(1)
    ci.save
  end

  def self.down
    drop_table :groups
    drop_table :groups_users
  end
end
