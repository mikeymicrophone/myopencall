require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FavoritesController do

  def mock_favorite(stubs={})
    @mock_favorite ||= mock_model(Favorite, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all favorites as @favorites" do
      mock(Favorite).find(:all){[mock_favorite]}
      get :index
      assigns[:favorites].should == [mock_favorite]
    end

    describe "with mime type of xml" do
  
      it "should render all favorites as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        favorites = []
        mock(Favorite).find(:all){favorites}
        mock(favorites).to_xml(){"generated XML"}
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested favorite as @favorite" do
      mock(Favorite).find("37"){mock_favorite}
      get :show, :id => "37"
      assigns[:favorite].should equal(mock_favorite)
    end
    
    describe "with mime type of xml" do

      it "should render the requested favorite as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        mock(Favorite).find("37"){mock_favorite}
        mock(mock_favorite).to_xml{"generated XML"}
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new favorite as @favorite" do
      #We need to call new before any mocking
      mock_favorite
      mock(Favorite).new{mock_favorite}
      get :new
      assigns[:favorite].should equal(mock_favorite)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested favorite as @favorite" do
      mock(Favorite).find("37"){mock_favorite}
      get :edit, :id => "37"
      assigns[:favorite].should equal(mock_favorite)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created favorite as @favorite" do
        favorite = mock_favorite(:save => true)
        mock(Favorite).new({'these' => 'params'}){favorite}
        post :create, :favorite => {:these => 'params'}
        assigns(:favorite).should equal(mock_favorite)
      end

      it "should redirect to the created favorite" do
        favorite = mock_favorite(:save => true)
        stub(Favorite).new{favorite}
        post :create, :favorite => {}
        response.should redirect_to(favorite_url(mock_favorite))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved favorite as @favorite" do
        favorite = mock_favorite(:save => false)
        stub(Favorite).new({'these' => 'params'}){favorite}
        post :create, :favorite => {:these => 'params'}
        assigns(:favorite).should equal(mock_favorite)
      end

      it "should re-render the 'new' template" do
        favorite = mock_favorite(:save => false)
        stub(Favorite).new{favorite}
        post :create, :favorite => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested favorite" do
        mock(Favorite).find("37"){mock_favorite}
        mock(mock_favorite).update_attributes({'these' => 'params'})
        put :update, :id => "37", :favorite => {:these => 'params'}
      end

      it "should expose the requested favorite as @favorite" do
        stub(Favorite).find{mock_favorite(:update_attributes => true)}
        put :update, :id => "1"
        assigns(:favorite).should equal(mock_favorite)
      end

      it "should redirect to the favorite" do
        stub(Favorite).find{mock_favorite(:update_attributes => true)}
        put :update, :id => "1"
        response.should redirect_to(favorite_url(mock_favorite))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested favorite" do
        mock(Favorite).find("37"){mock_favorite}
        mock(mock_favorite).update_attributes({'these' => 'params'})
        put :update, :id => "37", :favorite => {:these => 'params'}
      end

      it "should expose the favorite as @favorite" do
        stub(Favorite).find{mock_favorite(:update_attributes => false)}
        put :update, :id => "1"
        assigns(:favorite).should equal(mock_favorite)
      end

      it "should re-render the 'edit' template" do
        stub(Favorite).find{mock_favorite(:update_attributes => false)}
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested favorite" do
      mock(Favorite).find("37"){mock_favorite}
      mock(mock_favorite).destroy
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the favorites list" do
      stub(Favorite).find(){mock_favorite(:destroy => true)}
      delete :destroy, :id => "1"
      response.should redirect_to(favorites_url)
    end

  end

end
