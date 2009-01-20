class CreateLabels < ActiveRecord::Migration
  def self.up
    create_table :labels do |t|
      t.string :name, :null => false
      t.string :description, :null => false

      t.timestamps
    end

    Label.create(:name => 'trabajo en la huerta', :description => 'todo lo relacionado con trabajo en la huerta')
    Label.create(:name => 'pregunta', :description => 'utiliza este tipo de mensaje para preguntar')
    Label.create(:name => 'convocatorias', :description => 'convocatoria')
  end

  def self.down
    drop_table :labels
  end
end
