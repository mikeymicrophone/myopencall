class State < ActiveRecord::Base
  has_many :cities
  belongs_to :creator, :class_name => 'User'
end
