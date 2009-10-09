class Company < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :involvements, :as => :participant
  has_many :projects, :through => :involvements
  has_many :employments
  has_many :employees, :through => :employments, :source => :user
end
