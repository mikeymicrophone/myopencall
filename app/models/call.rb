class Call < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :project
  has_many :detials, :as => :subject
  
  named_scope :upcoming, :conditions => ['time > ?', Time.now]
end
