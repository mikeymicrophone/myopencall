class Call < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :project
  has_many :details, :as => :subject
  
  named_scope :upcoming, :conditions => ['time > ?', Time.now]
  
  after_create :notify_followers
  
  def notify_followers
    InterestMailer.deliver_new_call_notification(self, role.interested_users.map { |u| u.email }.join(', '))
  end
  
  def name
    "call for #{role.name.pluralize} at #{location.name} (#{project.name})"
  end
end
