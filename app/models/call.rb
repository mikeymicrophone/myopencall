class Call < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :project
  
  named_scope :upcoming, :conditions => ['time > ?', Time.now]
end
