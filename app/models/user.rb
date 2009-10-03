class User < ActiveRecord::Base
  has_many :projects, :foreign_key => 'creator_id'
  
  acts_as_authentic
  
end
