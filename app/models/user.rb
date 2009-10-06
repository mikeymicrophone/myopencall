class User < ActiveRecord::Base
  has_many :projects, :foreign_key => 'creator_id'
  has_many :details, :as => :subject
  
  acts_as_authentic
  
end
