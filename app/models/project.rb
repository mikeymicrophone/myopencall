class Project < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :calls
  has_many :roles, :through => :calls
end
