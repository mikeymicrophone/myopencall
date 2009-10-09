class AddInvolvements < ActiveRecord::Migration
  def self.up
    create_table :involvements do |t|
      t.integer :project_id
      t.string :participant_type
      t.integer :participant_id
      t.string :status
      t.text :description
      t.integer :creator_id
      t.timestamps
      t.datetime :deleted_at
    end
  end

  def self.down
    drop_table :involvements
  end
end
