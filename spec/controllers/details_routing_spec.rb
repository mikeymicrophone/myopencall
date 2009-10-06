require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DetailsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "details", :action => "index").should == "/details"
    end

    it "maps #new" do
      route_for(:controller => "details", :action => "new").should == "/details/new"
    end

    it "maps #show" do
      route_for(:controller => "details", :action => "show", :id => "1").should == "/details/1"
    end

    it "maps #edit" do
      route_for(:controller => "details", :action => "edit", :id => "1").should == "/details/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "details", :action => "create").should == {:path => "/details", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "details", :action => "update", :id => "1").should == {:path =>"/details/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "details", :action => "destroy", :id => "1").should == {:path =>"/details/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/details").should == {:controller => "details", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/details/new").should == {:controller => "details", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/details").should == {:controller => "details", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/details/1").should == {:controller => "details", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/details/1/edit").should == {:controller => "details", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/details/1").should == {:controller => "details", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/details/1").should == {:controller => "details", :action => "destroy", :id => "1"}
    end
  end
end
