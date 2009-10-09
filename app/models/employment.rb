class Employment < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  belongs_to :creator, :class_name => 'User'
end
