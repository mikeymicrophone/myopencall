class Location < ActiveRecord::Base
  has_many :calls
  has_many :details, :as => :subject
  belongs_to :city
  belongs_to :state
end
