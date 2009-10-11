require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FollowershipsController do

  def mock_followership(stubs={})
    @mock_followership ||= mock_model(Followership, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all followerships as @followerships" do
      mock(Followership).find(:all){[mock_followership]}
      get :index
      assigns[:followerships].should == [mock_followership]
    end

    describe "with mime type of xml" do
  
      it "should render all followerships as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        followerships = []
        mock(Followership).find(:all){followerships}
        mock(followerships).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested followership as @followership" do
      mock(Followership).find("37"){mock_followership}
      get :show, :id => "37"
      assigns[:followership].should equal(mock_followership)
    end
    
    describe "with mime type of xml" do

      it "should render the requested followership as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Followership).find("37"){mock_followership}
        mock(mock_followership).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new followership as @followership" do
      #We need to call new before any mocking
      mock_followership
      mock(Followership).new{mock_followership}
      get :new
      assigns[:followership].should equal(mock_followership)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested followership as @followership" do
      mock(Followership).find("37"){mock_followership}
      get :edit, :id => "37"
      assigns[:followership].should equal(mock_followership)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created followership as @followership" do
        followership = mock_followership(:save => true)
        mock(Followership).new({'these' => 'params'}){followership}
        post :create, :followership => {:these => 'params'}
        assigns(:followership).should equal(mock_followership)
      end

      it "should redirect to the created followership" do
        followership = mock_followership(:save => true)
        stub(Followership).new{followership}
        post :create, :followership => {}
        response.should redirect_to(followership_url(mock_followership))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved followership as @followership" do
        followership = mock_followership(:save => false)
        stub(Followership).new({'these' => 'params'}){followership}
        post :create, :followership => {:these => 'params'}
        assigns(:followership).should equal(mock_followership)
      end

      it "should re-render the 'new' template" do
        followership = mock_followership(:save => false)
        stub(Followership).new{followership}
        post :create, :followership => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested followership" do
        mock(Followership).find("37"){mock_followership}
        mock(mock_followership).update_attributes({'these' => 'params'})
        put :update, :id => "37", :followership => {:these => 'params'}
      end

      it "should expose the requested followership as @followership" do
        stub(Followership).find{mock_followership(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:followership).should equal(mock_followership)
      end

      it "should redirect to the followership" do
        stub(Followership).find{mock_followership(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(followership_url(mock_followership))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested followership" do
        mock(Followership).find("37"){mock_followership}
        mock(mock_followership).update_attributes({'these' => 'params'})
        put :update, :id => "37", :followership => {:these => 'params'}
      end

      it "should expose the followership as @followership" do
        stub(Followership).find{mock_followership(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:followership).should equal(mock_followership)
      end

      it "should re-render the 'edit' template" do
        stub(Followership).find{mock_followership(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested followership" do
      mock(Followership).find("37"){mock_followership}
      mock(mock_followership).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the followerships list" do
      stub(Followership).find(){mock_followership(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(followerships_url)
    end

  end

end
