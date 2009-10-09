require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InterestsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "interests", :action => "index").should == "/interests"
    end

    it "maps #new" do
      route_for(:controller => "interests", :action => "new").should == "/interests/new"
    end

    it "maps #show" do
      route_for(:controller => "interests", :action => "show", :id => "1").should == "/interests/1"
    end

    it "maps #edit" do
      route_for(:controller => "interests", :action => "edit", :id => "1").should == "/interests/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "interests", :action => "create").should == {:path => "/interests", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "interests", :action => "update", :id => "1").should == {:path =>"/interests/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "interests", :action => "destroy", :id => "1").should == {:path =>"/interests/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/interests").should == {:controller => "interests", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/interests/new").should == {:controller => "interests", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/interests").should == {:controller => "interests", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/interests/1").should == {:controller => "interests", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/interests/1/edit").should == {:controller => "interests", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/interests/1").should == {:controller => "interests", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/interests/1").should == {:controller => "interests", :action => "destroy", :id => "1"}
    end
  end
end
