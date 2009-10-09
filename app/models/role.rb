class Role < ActiveRecord::Base
  has_many :calls
  has_many :details, :as => :subject
  has_many :interests, :as => :subject
  has_many :interested_users, :through => :interests, :source => :user
end
