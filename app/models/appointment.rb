class Appointment < ActiveRecord::Base
  belongs_to :visitor, :polymorphic => true
  belongs_to :host, :polymorphic => true
  belongs_to :creator, :class_name => 'User'
  
  def accepted?
    status == 'accepted'
  end
end
