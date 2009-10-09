require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InvolvementsController do

  def mock_involvement(stubs={})
    @mock_involvement ||= mock_model(Involvement, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all involvements as @involvements" do
      mock(Involvement).find(:all){[mock_involvement]}
      get :index
      assigns[:involvements].should == [mock_involvement]
    end

    describe "with mime type of xml" do
  
      it "should render all involvements as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        involvements = []
        mock(Involvement).find(:all){involvements}
        mock(involvements).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested involvement as @involvement" do
      mock(Involvement).find("37"){mock_involvement}
      get :show, :id => "37"
      assigns[:involvement].should equal(mock_involvement)
    end
    
    describe "with mime type of xml" do

      it "should render the requested involvement as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Involvement).find("37"){mock_involvement}
        mock(mock_involvement).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new involvement as @involvement" do
      #We need to call new before any mocking
      mock_involvement
      mock(Involvement).new{mock_involvement}
      get :new
      assigns[:involvement].should equal(mock_involvement)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested involvement as @involvement" do
      mock(Involvement).find("37"){mock_involvement}
      get :edit, :id => "37"
      assigns[:involvement].should equal(mock_involvement)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created involvement as @involvement" do
        involvement = mock_involvement(:save => true)
        mock(Involvement).new({'these' => 'params'}){involvement}
        post :create, :involvement => {:these => 'params'}
        assigns(:involvement).should equal(mock_involvement)
      end

      it "should redirect to the created involvement" do
        involvement = mock_involvement(:save => true)
        stub(Involvement).new{involvement}
        post :create, :involvement => {}
        response.should redirect_to(involvement_url(mock_involvement))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved involvement as @involvement" do
        involvement = mock_involvement(:save => false)
        stub(Involvement).new({'these' => 'params'}){involvement}
        post :create, :involvement => {:these => 'params'}
        assigns(:involvement).should equal(mock_involvement)
      end

      it "should re-render the 'new' template" do
        involvement = mock_involvement(:save => false)
        stub(Involvement).new{involvement}
        post :create, :involvement => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested involvement" do
        mock(Involvement).find("37"){mock_involvement}
        mock(mock_involvement).update_attributes({'these' => 'params'})
        put :update, :id => "37", :involvement => {:these => 'params'}
      end

      it "should expose the requested involvement as @involvement" do
        stub(Involvement).find{mock_involvement(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:involvement).should equal(mock_involvement)
      end

      it "should redirect to the involvement" do
        stub(Involvement).find{mock_involvement(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(involvement_url(mock_involvement))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested involvement" do
        mock(Involvement).find("37"){mock_involvement}
        mock(mock_involvement).update_attributes({'these' => 'params'})
        put :update, :id => "37", :involvement => {:these => 'params'}
      end

      it "should expose the involvement as @involvement" do
        stub(Involvement).find{mock_involvement(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:involvement).should equal(mock_involvement)
      end

      it "should re-render the 'edit' template" do
        stub(Involvement).find{mock_involvement(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested involvement" do
      mock(Involvement).find("37"){mock_involvement}
      mock(mock_involvement).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the involvements list" do
      stub(Involvement).find(){mock_involvement(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(involvements_url)
    end

  end

end
