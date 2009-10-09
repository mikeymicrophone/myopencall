class CallHasEndTime < ActiveRecord::Migration
  def self.up
    add_column :calls, :end_time, :datetime
  end

  def self.down
    remove_column :calls, :end_time
  end
end
