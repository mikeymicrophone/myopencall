class AddLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :floor
      t.string :room
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
