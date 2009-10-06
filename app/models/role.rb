class Role < ActiveRecord::Base
  has_many :calls
  has_many :detials, :as => :subject
end
