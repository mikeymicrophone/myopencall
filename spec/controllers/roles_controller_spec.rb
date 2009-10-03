require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RolesController do

  def mock_role(stubs={})
    @mock_role ||= mock_model(Role, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all roles as @roles" do
      mock(Role).find(:all){[mock_role]}
      get :index
      assigns[:roles].should == [mock_role]
    end

    describe "with mime type of xml" do
  
      it "should render all roles as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        roles = []
        mock(Role).find(:all){roles}
        mock(roles).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested role as @role" do
      mock(Role).find("37"){mock_role}
      get :show, :id => "37"
      assigns[:role].should equal(mock_role)
    end
    
    describe "with mime type of xml" do

      it "should render the requested role as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Role).find("37"){mock_role}
        mock(mock_role).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new role as @role" do
      #We need to call new before any mocking
      mock_role
      mock(Role).new{mock_role}
      get :new
      assigns[:role].should equal(mock_role)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested role as @role" do
      mock(Role).find("37"){mock_role}
      get :edit, :id => "37"
      assigns[:role].should equal(mock_role)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created role as @role" do
        role = mock_role(:save => true)
        mock(Role).new({'these' => 'params'}){role}
        post :create, :role => {:these => 'params'}
        assigns(:role).should equal(mock_role)
      end

      it "should redirect to the created role" do
        role = mock_role(:save => true)
        stub(Role).new{role}
        post :create, :role => {}
        response.should redirect_to(role_url(mock_role))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved role as @role" do
        role = mock_role(:save => false)
        stub(Role).new({'these' => 'params'}){role}
        post :create, :role => {:these => 'params'}
        assigns(:role).should equal(mock_role)
      end

      it "should re-render the 'new' template" do
        role = mock_role(:save => false)
        stub(Role).new{role}
        post :create, :role => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested role" do
        mock(Role).find("37"){mock_role}
        mock(mock_role).update_attributes({'these' => 'params'})
        put :update, :id => "37", :role => {:these => 'params'}
      end

      it "should expose the requested role as @role" do
        stub(Role).find{mock_role(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:role).should equal(mock_role)
      end

      it "should redirect to the role" do
        stub(Role).find{mock_role(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(role_url(mock_role))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested role" do
        mock(Role).find("37"){mock_role}
        mock(mock_role).update_attributes({'these' => 'params'})
        put :update, :id => "37", :role => {:these => 'params'}
      end

      it "should expose the role as @role" do
        stub(Role).find{mock_role(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:role).should equal(mock_role)
      end

      it "should re-render the 'edit' template" do
        stub(Role).find{mock_role(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested role" do
      mock(Role).find("37"){mock_role}
      mock(mock_role).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the roles list" do
      stub(Role).find(){mock_role(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(roles_url)
    end

  end

end
