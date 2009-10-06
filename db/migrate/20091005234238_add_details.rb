class AddDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.text :content
      t.text :context
      t.string :subject_type
      t.integer :subject_id
      t.integer :creator_id
      t.integer :private
      t.timestamps
      t.boolean :delta
      t.datetime :deleted_at
    end
  end

  def self.down
    drop_table :details
  end
end
