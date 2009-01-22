class CreatePendings < ActiveRecord::Migration
  def self.up
    create_table :pendings do |t|
      t.references :user
      t.references :clip
    end
  end

  def self.down
    drop_table :pendings
  end
end
