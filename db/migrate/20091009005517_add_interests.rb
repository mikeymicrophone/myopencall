class AddInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.integer :subject_id
      t.string :subject_type
      t.integer :user_id
      t.text :content
      t.timestamps
      t.datetime :deleted_at
      t.delta
    end
  end

  def self.down
    drop_table :interests
  end
end
