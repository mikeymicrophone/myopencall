class City < ActiveRecord::Base
  belongs_to :state
  belongs_to :creator, :class_name => 'User'
  has_many :locations
  has_many :calls, :through => :locations
end
