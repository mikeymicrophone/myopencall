class Interest < ActiveRecord::Base
  belongs_to :subject, :polymorphic => true
  belongs_to :user
end
