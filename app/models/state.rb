class State < ActiveRecord::Base
  has_many :cities
  belongs_to :creator, :class_name => 'User'
  has_many :locations
  has_many :calls, :through => :locations
  has_many :businesses, :through => :cities
  
  def companies
    businesses.map { |b| b.company }.uniq
  end
end
