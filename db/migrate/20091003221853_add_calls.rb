class AddCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.integer :project_id
      t.integer :role_id
      t.integer :location_id
      t.timestamp :time
      t.integer :creator_id
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
