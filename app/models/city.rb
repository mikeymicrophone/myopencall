class City < ActiveRecord::Base
  belongs_to :state
  belongs_to :creator, :class_name => 'User'
end
