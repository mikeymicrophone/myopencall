class State < ActiveRecord::Base
  has_many :cities
  belongs_to :creator, :class_name => 'User'
  has_many :locations
  has_many :calls, :through => :locations
end
