class Call < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :project
end
