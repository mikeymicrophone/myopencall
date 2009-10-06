class Location < ActiveRecord::Base
  has_many :calls
  has_many :details, :as => :subject
end
