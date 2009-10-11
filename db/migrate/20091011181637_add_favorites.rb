class AddFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.integer :favorite_id
      t.string :favorite_type
      t.integer :creator_id
      t.timestamps
    end
  end

  def self.down
    drop_table :favorites
  end
end
