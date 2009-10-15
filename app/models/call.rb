class Call < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :project
  has_many :details, :as => :subject
  has_many :interests, :as => :subject
  has_many :interested_users, :through => :interests, :source => :user
  has_many :appointments, :as => :host
  belongs_to :creator, :class_name => 'User'
  named_scope :upcoming, :conditions => ['time > ?', Time.now]
  
  after_create :notify_followers
  
  def notify_followers
    InterestMailer.deliver_new_call_notification(self, role.interested_users.map { |u| u.email }.join(', ')) unless role.interested_users.empty?
  end
  
  def name
    "call for #{role.name.pluralize} at #{location.name} (#{project.name})"
  end
end
