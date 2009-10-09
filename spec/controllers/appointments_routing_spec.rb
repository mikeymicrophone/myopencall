require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AppointmentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "appointments", :action => "index").should == "/appointments"
    end

    it "maps #new" do
      route_for(:controller => "appointments", :action => "new").should == "/appointments/new"
    end

    it "maps #show" do
      route_for(:controller => "appointments", :action => "show", :id => "1").should == "/appointments/1"
    end

    it "maps #edit" do
      route_for(:controller => "appointments", :action => "edit", :id => "1").should == "/appointments/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "appointments", :action => "create").should == {:path => "/appointments", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "appointments", :action => "update", :id => "1").should == {:path =>"/appointments/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "appointments", :action => "destroy", :id => "1").should == {:path =>"/appointments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/appointments").should == {:controller => "appointments", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/appointments/new").should == {:controller => "appointments", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/appointments").should == {:controller => "appointments", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/appointments/1").should == {:controller => "appointments", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/appointments/1/edit").should == {:controller => "appointments", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/appointments/1").should == {:controller => "appointments", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/appointments/1").should == {:controller => "appointments", :action => "destroy", :id => "1"}
    end
  end
end
