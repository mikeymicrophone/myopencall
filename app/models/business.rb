class Business < ActiveRecord::Base
  belongs_to :company
  belongs_to :city
  has_one :state, :through => :city
end
