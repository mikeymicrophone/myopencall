require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectsController do

  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all projects as @projects" do
      mock(Project).find(:all){[mock_project]}
      get :index
      assigns[:projects].should == [mock_project]
    end

    describe "with mime type of xml" do
  
      it "should render all projects as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        projects = []
        mock(Project).find(:all){projects}
        mock(projects).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested project as @project" do
      mock(Project).find("37"){mock_project}
      get :show, :id => "37"
      assigns[:project].should equal(mock_project)
    end
    
    describe "with mime type of xml" do

      it "should render the requested project as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Project).find("37"){mock_project}
        mock(mock_project).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new project as @project" do
      #We need to call new before any mocking
      mock_project
      mock(Project).new{mock_project}
      get :new
      assigns[:project].should equal(mock_project)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested project as @project" do
      mock(Project).find("37"){mock_project}
      get :edit, :id => "37"
      assigns[:project].should equal(mock_project)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created project as @project" do
        project = mock_project(:save => true)
        mock(Project).new({'these' => 'params'}){project}
        post :create, :project => {:these => 'params'}
        assigns(:project).should equal(mock_project)
      end

      it "should redirect to the created project" do
        project = mock_project(:save => true)
        stub(Project).new{project}
        post :create, :project => {}
        response.should redirect_to(project_url(mock_project))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved project as @project" do
        project = mock_project(:save => false)
        stub(Project).new({'these' => 'params'}){project}
        post :create, :project => {:these => 'params'}
        assigns(:project).should equal(mock_project)
      end

      it "should re-render the 'new' template" do
        project = mock_project(:save => false)
        stub(Project).new{project}
        post :create, :project => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested project" do
        mock(Project).find("37"){mock_project}
        mock(mock_project).update_attributes({'these' => 'params'})
        put :update, :id => "37", :project => {:these => 'params'}
      end

      it "should expose the requested project as @project" do
        stub(Project).find{mock_project(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:project).should equal(mock_project)
      end

      it "should redirect to the project" do
        stub(Project).find{mock_project(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(project_url(mock_project))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested project" do
        mock(Project).find("37"){mock_project}
        mock(mock_project).update_attributes({'these' => 'params'})
        put :update, :id => "37", :project => {:these => 'params'}
      end

      it "should expose the project as @project" do
        stub(Project).find{mock_project(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:project).should equal(mock_project)
      end

      it "should re-render the 'edit' template" do
        stub(Project).find{mock_project(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested project" do
      mock(Project).find("37"){mock_project}
      mock(mock_project).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the projects list" do
      stub(Project).find(){mock_project(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(projects_url)
    end

  end

end
