class Involvement < ActiveRecord::Base
  belongs_to :project
  belongs_to :participant, :polymorphic => true
  belongs_to :creator, :class_name => 'User'
end
