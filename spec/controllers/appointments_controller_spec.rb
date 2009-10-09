require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AppointmentsController do

  def mock_appointment(stubs={})
    @mock_appointment ||= mock_model(Appointment, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all appointments as @appointments" do
      mock(Appointment).find(:all){[mock_appointment]}
      get :index
      assigns[:appointments].should == [mock_appointment]
    end

    describe "with mime type of xml" do
  
      it "should render all appointments as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        appointments = []
        mock(Appointment).find(:all){appointments}
        mock(appointments).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested appointment as @appointment" do
      mock(Appointment).find("37"){mock_appointment}
      get :show, :id => "37"
      assigns[:appointment].should equal(mock_appointment)
    end
    
    describe "with mime type of xml" do

      it "should render the requested appointment as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Appointment).find("37"){mock_appointment}
        mock(mock_appointment).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new appointment as @appointment" do
      #We need to call new before any mocking
      mock_appointment
      mock(Appointment).new{mock_appointment}
      get :new
      assigns[:appointment].should equal(mock_appointment)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested appointment as @appointment" do
      mock(Appointment).find("37"){mock_appointment}
      get :edit, :id => "37"
      assigns[:appointment].should equal(mock_appointment)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created appointment as @appointment" do
        appointment = mock_appointment(:save => true)
        mock(Appointment).new({'these' => 'params'}){appointment}
        post :create, :appointment => {:these => 'params'}
        assigns(:appointment).should equal(mock_appointment)
      end

      it "should redirect to the created appointment" do
        appointment = mock_appointment(:save => true)
        stub(Appointment).new{appointment}
        post :create, :appointment => {}
        response.should redirect_to(appointment_url(mock_appointment))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved appointment as @appointment" do
        appointment = mock_appointment(:save => false)
        stub(Appointment).new({'these' => 'params'}){appointment}
        post :create, :appointment => {:these => 'params'}
        assigns(:appointment).should equal(mock_appointment)
      end

      it "should re-render the 'new' template" do
        appointment = mock_appointment(:save => false)
        stub(Appointment).new{appointment}
        post :create, :appointment => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested appointment" do
        mock(Appointment).find("37"){mock_appointment}
        mock(mock_appointment).update_attributes({'these' => 'params'})
        put :update, :id => "37", :appointment => {:these => 'params'}
      end

      it "should expose the requested appointment as @appointment" do
        stub(Appointment).find{mock_appointment(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:appointment).should equal(mock_appointment)
      end

      it "should redirect to the appointment" do
        stub(Appointment).find{mock_appointment(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(appointment_url(mock_appointment))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested appointment" do
        mock(Appointment).find("37"){mock_appointment}
        mock(mock_appointment).update_attributes({'these' => 'params'})
        put :update, :id => "37", :appointment => {:these => 'params'}
      end

      it "should expose the appointment as @appointment" do
        stub(Appointment).find{mock_appointment(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:appointment).should equal(mock_appointment)
      end

      it "should re-render the 'edit' template" do
        stub(Appointment).find{mock_appointment(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested appointment" do
      mock(Appointment).find("37"){mock_appointment}
      mock(mock_appointment).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the appointments list" do
      stub(Appointment).find(){mock_appointment(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(appointments_url)
    end

  end

end
