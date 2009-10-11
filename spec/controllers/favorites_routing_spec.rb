require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FavoritesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "favorites", :action => "index").should == "/favorites"
    end

    it "maps #new" do
      route_for(:controller => "favorites", :action => "new").should == "/favorites/new"
    end

    it "maps #show" do
      route_for(:controller => "favorites", :action => "show", :id => "1").should == "/favorites/1"
    end

    it "maps #edit" do
      route_for(:controller => "favorites", :action => "edit", :id => "1").should == "/favorites/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "favorites", :action => "create").should == {:path => "/favorites", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "favorites", :action => "update", :id => "1").should == {:path =>"/favorites/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "favorites", :action => "destroy", :id => "1").should == {:path =>"/favorites/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/favorites").should == {:controller => "favorites", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/favorites/new").should == {:controller => "favorites", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/favorites").should == {:controller => "favorites", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/favorites/1").should == {:controller => "favorites", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/favorites/1/edit").should == {:controller => "favorites", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/favorites/1").should == {:controller => "favorites", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/favorites/1").should == {:controller => "favorites", :action => "destroy", :id => "1"}
    end
  end
end
