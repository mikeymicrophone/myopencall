require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FollowershipsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "followerships", :action => "index").should == "/followerships"
    end

    it "maps #new" do
      route_for(:controller => "followerships", :action => "new").should == "/followerships/new"
    end

    it "maps #show" do
      route_for(:controller => "followerships", :action => "show", :id => "1").should == "/followerships/1"
    end

    it "maps #edit" do
      route_for(:controller => "followerships", :action => "edit", :id => "1").should == "/followerships/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "followerships", :action => "create").should == {:path => "/followerships", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "followerships", :action => "update", :id => "1").should == {:path =>"/followerships/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "followerships", :action => "destroy", :id => "1").should == {:path =>"/followerships/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/followerships").should == {:controller => "followerships", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/followerships/new").should == {:controller => "followerships", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/followerships").should == {:controller => "followerships", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/followerships/1").should == {:controller => "followerships", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/followerships/1/edit").should == {:controller => "followerships", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/followerships/1").should == {:controller => "followerships", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/followerships/1").should == {:controller => "followerships", :action => "destroy", :id => "1"}
    end
  end
end
