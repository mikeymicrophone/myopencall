require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "states", :action => "index").should == "/states"
    end

    it "maps #new" do
      route_for(:controller => "states", :action => "new").should == "/states/new"
    end

    it "maps #show" do
      route_for(:controller => "states", :action => "show", :id => "1").should == "/states/1"
    end

    it "maps #edit" do
      route_for(:controller => "states", :action => "edit", :id => "1").should == "/states/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "states", :action => "create").should == {:path => "/states", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "states", :action => "update", :id => "1").should == {:path =>"/states/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "states", :action => "destroy", :id => "1").should == {:path =>"/states/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/states").should == {:controller => "states", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/states/new").should == {:controller => "states", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/states").should == {:controller => "states", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/states/1").should == {:controller => "states", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/states/1/edit").should == {:controller => "states", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/states/1").should == {:controller => "states", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/states/1").should == {:controller => "states", :action => "destroy", :id => "1"}
    end
  end
end
