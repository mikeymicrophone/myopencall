class AddFollowerships < ActiveRecord::Migration
  def self.up
    create_table :followerships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :followerships
  end
end
