require 'machinist/active_record'
require 'sham'
require 'forgery'

User.blueprint do
  login { Forgery(:internet).user_name }
  email { Forgery(:internet).email_address }
  password { @pw = Forgery(:basic).password }
  password_confirmation { @pw }
end

Call.blueprint do
  project { Project.make }
  role { Role.make }
end

Project.blueprint do
  
end

Role.blueprint do
  
end

Appointment.blueprint do
  
end