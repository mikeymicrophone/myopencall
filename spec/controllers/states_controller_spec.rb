require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatesController do

  def mock_state(stubs={})
    @mock_state ||= mock_model(State, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all states as @states" do
      mock(State).find(:all){[mock_state]}
      get :index
      assigns[:states].should == [mock_state]
    end

    describe "with mime type of xml" do
  
      it "should render all states as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        states = []
        mock(State).find(:all){states}
        mock(states).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested state as @state" do
      mock(State).find("37"){mock_state}
      get :show, :id => "37"
      assigns[:state].should equal(mock_state)
    end
    
    describe "with mime type of xml" do

      it "should render the requested state as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(State).find("37"){mock_state}
        mock(mock_state).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new state as @state" do
      #We need to call new before any mocking
      mock_state
      mock(State).new{mock_state}
      get :new
      assigns[:state].should equal(mock_state)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested state as @state" do
      mock(State).find("37"){mock_state}
      get :edit, :id => "37"
      assigns[:state].should equal(mock_state)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created state as @state" do
        state = mock_state(:save => true)
        mock(State).new({'these' => 'params'}){state}
        post :create, :state => {:these => 'params'}
        assigns(:state).should equal(mock_state)
      end

      it "should redirect to the created state" do
        state = mock_state(:save => true)
        stub(State).new{state}
        post :create, :state => {}
        response.should redirect_to(state_url(mock_state))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved state as @state" do
        state = mock_state(:save => false)
        stub(State).new({'these' => 'params'}){state}
        post :create, :state => {:these => 'params'}
        assigns(:state).should equal(mock_state)
      end

      it "should re-render the 'new' template" do
        state = mock_state(:save => false)
        stub(State).new{state}
        post :create, :state => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested state" do
        mock(State).find("37"){mock_state}
        mock(mock_state).update_attributes({'these' => 'params'})
        put :update, :id => "37", :state => {:these => 'params'}
      end

      it "should expose the requested state as @state" do
        stub(State).find{mock_state(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:state).should equal(mock_state)
      end

      it "should redirect to the state" do
        stub(State).find{mock_state(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(state_url(mock_state))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested state" do
        mock(State).find("37"){mock_state}
        mock(mock_state).update_attributes({'these' => 'params'})
        put :update, :id => "37", :state => {:these => 'params'}
      end

      it "should expose the state as @state" do
        stub(State).find{mock_state(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:state).should equal(mock_state)
      end

      it "should re-render the 'edit' template" do
        stub(State).find{mock_state(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested state" do
      mock(State).find("37"){mock_state}
      mock(mock_state).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the states list" do
      stub(State).find(){mock_state(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(states_url)
    end

  end

end
