class Project < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :calls
  has_many :roles, :through => :calls
  has_many :details, :as => :subject
  has_many :interests, :as => :subject
  has_many :interested_users, :through => :interests, :source => :user
end
