class AddEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.integer :creator_id
      t.timestamps
      t.deleted_at
    end
  end

  def self.down
    drop_table :employments
  end
end
