require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmploymentsController do

  def mock_employment(stubs={})
    @mock_employment ||= mock_model(Employment, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all employments as @employments" do
      mock(Employment).find(:all){[mock_employment]}
      get :index
      assigns[:employments].should == [mock_employment]
    end

    describe "with mime type of xml" do
  
      it "should render all employments as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        employments = []
        mock(Employment).find(:all){employments}
        mock(employments).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested employment as @employment" do
      mock(Employment).find("37"){mock_employment}
      get :show, :id => "37"
      assigns[:employment].should equal(mock_employment)
    end
    
    describe "with mime type of xml" do

      it "should render the requested employment as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Employment).find("37"){mock_employment}
        mock(mock_employment).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new employment as @employment" do
      #We need to call new before any mocking
      mock_employment
      mock(Employment).new{mock_employment}
      get :new
      assigns[:employment].should equal(mock_employment)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested employment as @employment" do
      mock(Employment).find("37"){mock_employment}
      get :edit, :id => "37"
      assigns[:employment].should equal(mock_employment)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created employment as @employment" do
        employment = mock_employment(:save => true)
        mock(Employment).new({'these' => 'params'}){employment}
        post :create, :employment => {:these => 'params'}
        assigns(:employment).should equal(mock_employment)
      end

      it "should redirect to the created employment" do
        employment = mock_employment(:save => true)
        stub(Employment).new{employment}
        post :create, :employment => {}
        response.should redirect_to(employment_url(mock_employment))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved employment as @employment" do
        employment = mock_employment(:save => false)
        stub(Employment).new({'these' => 'params'}){employment}
        post :create, :employment => {:these => 'params'}
        assigns(:employment).should equal(mock_employment)
      end

      it "should re-render the 'new' template" do
        employment = mock_employment(:save => false)
        stub(Employment).new{employment}
        post :create, :employment => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested employment" do
        mock(Employment).find("37"){mock_employment}
        mock(mock_employment).update_attributes({'these' => 'params'})
        put :update, :id => "37", :employment => {:these => 'params'}
      end

      it "should expose the requested employment as @employment" do
        stub(Employment).find{mock_employment(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:employment).should equal(mock_employment)
      end

      it "should redirect to the employment" do
        stub(Employment).find{mock_employment(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(employment_url(mock_employment))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested employment" do
        mock(Employment).find("37"){mock_employment}
        mock(mock_employment).update_attributes({'these' => 'params'})
        put :update, :id => "37", :employment => {:these => 'params'}
      end

      it "should expose the employment as @employment" do
        stub(Employment).find{mock_employment(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:employment).should equal(mock_employment)
      end

      it "should re-render the 'edit' template" do
        stub(Employment).find{mock_employment(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested employment" do
      mock(Employment).find("37"){mock_employment}
      mock(mock_employment).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the employments list" do
      stub(Employment).find(){mock_employment(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(employments_url)
    end

  end

end
