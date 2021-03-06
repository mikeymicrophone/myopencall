class User < ActiveRecord::Base
  has_many :projects, :foreign_key => 'creator_id'
  has_many :details, :as => :subject
  has_many :interests
  has_many :interesting_roles, :through => :interests, :source_type => 'Role', :source => :subject
  has_many :interesting_projects, :through => :interests, :source_type => 'Project', :source => :subject
  has_many :interesting_calls, :through => :interests, :source_type => 'Call', :source => :subject
  has_many :employments
  has_many :employers, :through => :employments, :source => :company
  has_many :involvements, :as => :participant
  has_many :involved_projects, :through => :involvements, :source => :project
  has_many :visiting_appointments, :class_name => 'Appointment', :as => :visitor
  has_many :hosting_appointments, :class_name => 'Appointment', :as => :host
  has_many :calls, :foreign_key => :creator_id
  has_many :favorites, :foreign_key => :creator_id
  has_many :favorite_users, :through => :favorites, :source => :favorite, :source_type => 'User'
  has_many :favoriteds, :as => :favorite, :class_name => 'Favorite'
  has_many :a_friendships, :foreign_key => :accepter_id, :class_name => 'Friendship', :conditions => {:status => 'accepted'}
  has_many :b_friendships, :foreign_key => :requester_id, :class_name => 'Friendship', :conditions => {:status => 'accepted'}
  has_many :requested_friendships, :foreign_key => :accepter_id, :class_name => 'Friendship', :conditions => {:status => 'requested'}
  has_many :followerships, :foreign_key => :followed_id, :conditions => {:status => 'following'}
  has_many :followers, :through => :followerships
  has_many :followings, :foreign_key => :follower_id, :class_name => 'Followership', :conditions => {:status => 'following'}
  has_many :followeds, :through => :followings
  has_many :businesses, :through => :employers
  # has_many :call_appointments, :through => :calls
  
  acts_as_authentic
  
  def friendships opts = {}
    friendships = a_friendships + b_friendships
    if opts[:random] = false
      friends
    else
      friendships.sort_by { rand }
    end
  end
  
  def is_friends_with friend
    friendships.map { |f| [f.requester_id, f.accepter_id] }.flatten.include?(friend.id)
  end
  
  def is_following what
    followings.map { |f| f.followed_id }.include?(what.id)
  end
  
  def is_interested_in something
    interests.find_by_subject_type_and_subject_id(something.class.name, something.id)
  end

  def is_involved_in project
    involvements.find_by_project_id(project.id)
  end

  def is_employed_at company
    employments.find_by_company_id(company.id)
  end
  
  def is_hosting appointment
    case appointment.host
    when User
      appointment.host == self
    when Call
      appointment.host.creator == self
    when Company
      is_employed_at apointment.host
    end
  end
  
  def call_appointments
    calls.map { |c| c.appointments }.flatten
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_activation_instructions(self)
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end
  
  def activate!
    self.active = true
    save
  end  
end
