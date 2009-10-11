class Favorite < ActiveRecord::Base
  belongs_to :favorite, :polymorphic => true
  belongs_to :creator, :class_name => 'User'
end
