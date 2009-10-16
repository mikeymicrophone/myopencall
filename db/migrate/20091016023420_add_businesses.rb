class AddBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name
      t.integer :company_id
      t.integer :city_id
      t.text :description
      t.integer :creator_id
      t.integer :location_id
      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
