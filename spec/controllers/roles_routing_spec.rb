require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RolesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "roles", :action => "index").should == "/roles"
    end

    it "maps #new" do
      route_for(:controller => "roles", :action => "new").should == "/roles/new"
    end

    it "maps #show" do
      route_for(:controller => "roles", :action => "show", :id => "1").should == "/roles/1"
    end

    it "maps #edit" do
      route_for(:controller => "roles", :action => "edit", :id => "1").should == "/roles/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "roles", :action => "create").should == {:path => "/roles", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "roles", :action => "update", :id => "1").should == {:path =>"/roles/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "roles", :action => "destroy", :id => "1").should == {:path =>"/roles/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/roles").should == {:controller => "roles", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/roles/new").should == {:controller => "roles", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/roles").should == {:controller => "roles", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/roles/1").should == {:controller => "roles", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/roles/1/edit").should == {:controller => "roles", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/roles/1").should == {:controller => "roles", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/roles/1").should == {:controller => "roles", :action => "destroy", :id => "1"}
    end
  end
end
