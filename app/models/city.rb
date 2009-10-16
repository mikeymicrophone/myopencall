class City < ActiveRecord::Base
  belongs_to :state
  belongs_to :creator, :class_name => 'User'
  has_many :locations
  has_many :calls, :through => :locations
  has_many :businesses
  has_many :companies, :through => :businesses
end
