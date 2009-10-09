class Project < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :calls
  has_many :roles, :through => :calls
  has_many :details, :as => :subject
  has_many :interests, :as => :subject
  has_many :interested_users, :through => :interests, :source => :user
  has_many :involvements
  has_many :involved_users, :through => :involvements, :source => :participant, :source_type => 'User'
  has_many :involved_companies, :through => :involvements, :source => :participant, :source_type => 'Company'
end
