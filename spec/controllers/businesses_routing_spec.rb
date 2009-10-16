require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BusinessesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "businesses", :action => "index").should == "/businesses"
    end

    it "maps #new" do
      route_for(:controller => "businesses", :action => "new").should == "/businesses/new"
    end

    it "maps #show" do
      route_for(:controller => "businesses", :action => "show", :id => "1").should == "/businesses/1"
    end

    it "maps #edit" do
      route_for(:controller => "businesses", :action => "edit", :id => "1").should == "/businesses/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "businesses", :action => "create").should == {:path => "/businesses", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "businesses", :action => "update", :id => "1").should == {:path =>"/businesses/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "businesses", :action => "destroy", :id => "1").should == {:path =>"/businesses/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/businesses").should == {:controller => "businesses", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/businesses/new").should == {:controller => "businesses", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/businesses").should == {:controller => "businesses", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/businesses/1").should == {:controller => "businesses", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/businesses/1/edit").should == {:controller => "businesses", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/businesses/1").should == {:controller => "businesses", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/businesses/1").should == {:controller => "businesses", :action => "destroy", :id => "1"}
    end
  end
end
