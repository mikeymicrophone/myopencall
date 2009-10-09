class User < ActiveRecord::Base
  has_many :projects, :foreign_key => 'creator_id'
  has_many :details, :as => :subject
  has_many :interests
  has_many :interesting_roles, :through => :interests, :source_type => 'Role', :source => :subject
  
  acts_as_authentic
  
  def is_interested_in something
    interests.find_by_subject_type_and_subject_id(something.class.name, something.id)
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  
end
