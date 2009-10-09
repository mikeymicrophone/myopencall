class User < ActiveRecord::Base
  has_many :projects, :foreign_key => 'creator_id'
  has_many :details, :as => :subject
  has_many :interests
  has_many :interesting_roles, :through => :interests, :source_type => 'Role', :source => :subject
  has_many :employments
  
  
  acts_as_authentic
  
  def is_interested_in something
    interests.find_by_subject_type_and_subject_id(something.class.name, something.id)
  end

  def is_employed_at company
    employments.find_by_company_id(company.id)
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_activation_instructions(self)
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end
  
  def activate!
    self.active = true
    save
  end
  
  
end
