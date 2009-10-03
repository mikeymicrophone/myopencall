require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CallsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "calls", :action => "index").should == "/calls"
    end

    it "maps #new" do
      route_for(:controller => "calls", :action => "new").should == "/calls/new"
    end

    it "maps #show" do
      route_for(:controller => "calls", :action => "show", :id => "1").should == "/calls/1"
    end

    it "maps #edit" do
      route_for(:controller => "calls", :action => "edit", :id => "1").should == "/calls/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "calls", :action => "create").should == {:path => "/calls", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "calls", :action => "update", :id => "1").should == {:path =>"/calls/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "calls", :action => "destroy", :id => "1").should == {:path =>"/calls/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/calls").should == {:controller => "calls", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/calls/new").should == {:controller => "calls", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/calls").should == {:controller => "calls", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/calls/1").should == {:controller => "calls", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/calls/1/edit").should == {:controller => "calls", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/calls/1").should == {:controller => "calls", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/calls/1").should == {:controller => "calls", :action => "destroy", :id => "1"}
    end
  end
end
