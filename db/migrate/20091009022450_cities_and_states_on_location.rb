class CitiesAndStatesOnLocation < ActiveRecord::Migration
  def self.up
    rename_column :locations, :city, :city_id
    change_column :locations, :city_id, :integer
    rename_column :locations, :state, :state_id
    change_column :locations, :state_id, :integer
  end

  def self.down
    rename_column :locations, :state_id, :state
    change_column :locations, :state, :string
    rename_column :locations, :city_id, :city
    change_column :locations, :city, :string
  end
end
