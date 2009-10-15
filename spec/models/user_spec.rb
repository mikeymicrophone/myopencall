require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  
  before do
    @user = User.make
  end
  
  it 'should know which calls it is managing' do
    @call = Call.make(:creator => @user)
    @appointment = Appointment.make(:host => @call)
    @user.call_appointments.should == [@appointment]
  end
end