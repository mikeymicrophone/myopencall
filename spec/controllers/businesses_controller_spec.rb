require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BusinessesController do

  def mock_business(stubs={})
    @mock_business ||= mock_model(Business, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all businesses as @businesses" do
      mock(Business).find(:all){[mock_business]}
      get :index
      assigns[:businesses].should == [mock_business]
    end

    describe "with mime type of xml" do
  
      it "should render all businesses as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        businesses = []
        mock(Business).find(:all){businesses}
        mock(businesses).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested business as @business" do
      mock(Business).find("37"){mock_business}
      get :show, :id => "37"
      assigns[:business].should equal(mock_business)
    end
    
    describe "with mime type of xml" do

      it "should render the requested business as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Business).find("37"){mock_business}
        mock(mock_business).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new business as @business" do
      #We need to call new before any mocking
      mock_business
      mock(Business).new{mock_business}
      get :new
      assigns[:business].should equal(mock_business)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested business as @business" do
      mock(Business).find("37"){mock_business}
      get :edit, :id => "37"
      assigns[:business].should equal(mock_business)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created business as @business" do
        business = mock_business(:save => true)
        mock(Business).new({'these' => 'params'}){business}
        post :create, :business => {:these => 'params'}
        assigns(:business).should equal(mock_business)
      end

      it "should redirect to the created business" do
        business = mock_business(:save => true)
        stub(Business).new{business}
        post :create, :business => {}
        response.should redirect_to(business_url(mock_business))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved business as @business" do
        business = mock_business(:save => false)
        stub(Business).new({'these' => 'params'}){business}
        post :create, :business => {:these => 'params'}
        assigns(:business).should equal(mock_business)
      end

      it "should re-render the 'new' template" do
        business = mock_business(:save => false)
        stub(Business).new{business}
        post :create, :business => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested business" do
        mock(Business).find("37"){mock_business}
        mock(mock_business).update_attributes({'these' => 'params'})
        put :update, :id => "37", :business => {:these => 'params'}
      end

      it "should expose the requested business as @business" do
        stub(Business).find{mock_business(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:business).should equal(mock_business)
      end

      it "should redirect to the business" do
        stub(Business).find{mock_business(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(business_url(mock_business))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested business" do
        mock(Business).find("37"){mock_business}
        mock(mock_business).update_attributes({'these' => 'params'})
        put :update, :id => "37", :business => {:these => 'params'}
      end

      it "should expose the business as @business" do
        stub(Business).find{mock_business(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:business).should equal(mock_business)
      end

      it "should re-render the 'edit' template" do
        stub(Business).find{mock_business(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested business" do
      mock(Business).find("37"){mock_business}
      mock(mock_business).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the businesses list" do
      stub(Business).find(){mock_business(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(businesses_url)
    end

  end

end
