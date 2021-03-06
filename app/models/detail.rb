class Detail < ActiveRecord::Base
  belongs_to :subject, :polymorphic => true
  belongs_to :creator, :class_name => 'User'
  
  named_scope :public, {:conditions => ['details.private > 0']}
  named_scope :private, {:conditions => ['details.private = 0']}
  
  def private?
    self.private == 0
  end
end
