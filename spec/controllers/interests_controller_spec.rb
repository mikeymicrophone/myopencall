require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InterestsController do

  def mock_interest(stubs={})
    @mock_interest ||= mock_model(Interest, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all interests as @interests" do
      mock(Interest).find(:all){[mock_interest]}
      get :index
      assigns[:interests].should == [mock_interest]
    end

    describe "with mime type of xml" do
  
      it "should render all interests as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        interests = []
        mock(Interest).find(:all){interests}
        mock(interests).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested interest as @interest" do
      mock(Interest).find("37"){mock_interest}
      get :show, :id => "37"
      assigns[:interest].should equal(mock_interest)
    end
    
    describe "with mime type of xml" do

      it "should render the requested interest as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Interest).find("37"){mock_interest}
        mock(mock_interest).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new interest as @interest" do
      #We need to call new before any mocking
      mock_interest
      mock(Interest).new{mock_interest}
      get :new
      assigns[:interest].should equal(mock_interest)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested interest as @interest" do
      mock(Interest).find("37"){mock_interest}
      get :edit, :id => "37"
      assigns[:interest].should equal(mock_interest)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created interest as @interest" do
        interest = mock_interest(:save => true)
        mock(Interest).new({'these' => 'params'}){interest}
        post :create, :interest => {:these => 'params'}
        assigns(:interest).should equal(mock_interest)
      end

      it "should redirect to the created interest" do
        interest = mock_interest(:save => true)
        stub(Interest).new{interest}
        post :create, :interest => {}
        response.should redirect_to(interest_url(mock_interest))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved interest as @interest" do
        interest = mock_interest(:save => false)
        stub(Interest).new({'these' => 'params'}){interest}
        post :create, :interest => {:these => 'params'}
        assigns(:interest).should equal(mock_interest)
      end

      it "should re-render the 'new' template" do
        interest = mock_interest(:save => false)
        stub(Interest).new{interest}
        post :create, :interest => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested interest" do
        mock(Interest).find("37"){mock_interest}
        mock(mock_interest).update_attributes({'these' => 'params'})
        put :update, :id => "37", :interest => {:these => 'params'}
      end

      it "should expose the requested interest as @interest" do
        stub(Interest).find{mock_interest(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:interest).should equal(mock_interest)
      end

      it "should redirect to the interest" do
        stub(Interest).find{mock_interest(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(interest_url(mock_interest))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested interest" do
        mock(Interest).find("37"){mock_interest}
        mock(mock_interest).update_attributes({'these' => 'params'})
        put :update, :id => "37", :interest => {:these => 'params'}
      end

      it "should expose the interest as @interest" do
        stub(Interest).find{mock_interest(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:interest).should equal(mock_interest)
      end

      it "should re-render the 'edit' template" do
        stub(Interest).find{mock_interest(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested interest" do
      mock(Interest).find("37"){mock_interest}
      mock(mock_interest).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the interests list" do
      stub(Interest).find(){mock_interest(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(interests_url)
    end

  end

end
