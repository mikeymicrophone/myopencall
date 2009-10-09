class AddAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.string :visitor_type
      t.integer :visitor_id
      t.string :host_type
      t.integer :host_id
      t.text :description
      t.string :status
      t.datetime :begins_at
      t.datetime :ends_at
      t.integer :creator_id
      t.timestamps
      t.datetime :deleted_at
    end
  end

  def self.down
    drop_table :appointments
  end
end
