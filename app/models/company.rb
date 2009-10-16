class Company < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :involvements, :as => :participant
  has_many :involved_projects, :through => :involvements, :source => :project
  has_many :projects, :through => :involvements
  has_many :employments
  has_many :employees, :through => :employments, :source => :user
  has_many :businesses
  has_many :cities, :through => :businesses
end
