require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmploymentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "employments", :action => "index").should == "/employments"
    end

    it "maps #new" do
      route_for(:controller => "employments", :action => "new").should == "/employments/new"
    end

    it "maps #show" do
      route_for(:controller => "employments", :action => "show", :id => "1").should == "/employments/1"
    end

    it "maps #edit" do
      route_for(:controller => "employments", :action => "edit", :id => "1").should == "/employments/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "employments", :action => "create").should == {:path => "/employments", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "employments", :action => "update", :id => "1").should == {:path =>"/employments/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "employments", :action => "destroy", :id => "1").should == {:path =>"/employments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/employments").should == {:controller => "employments", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/employments/new").should == {:controller => "employments", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/employments").should == {:controller => "employments", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/employments/1").should == {:controller => "employments", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/employments/1/edit").should == {:controller => "employments", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/employments/1").should == {:controller => "employments", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/employments/1").should == {:controller => "employments", :action => "destroy", :id => "1"}
    end
  end
end
