class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.boolean :gak, :null => false
      t.integer :cestas, :null => false, :default => 0
      t.timestamps
    end

    create_table :groups_users, :id => false do |t|
      t.references :group
      t.references :user
    end

    cyl = Group.new(:id => Group.get(:cyl), :name => 'CyL', :gak => false, :description => 'Tod@s estamos en Crestas y Lechugas.')
    cyl.users << User.find(:all)
    cyl.save

    ci = Group.create(:id => Group.get(:web), :name => 'Administración web', :gak => false,
      :description => 'Se encargan de mantener la web de Crestas y Lechugas.')
    ci.users << User.find(:all, :conditions =>{:admin => true})
    ci.save

  end

  def self.down
    drop_table :groups
    drop_table :groups_users
  end
end
