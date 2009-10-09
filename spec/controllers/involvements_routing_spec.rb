require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InvolvementsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "involvements", :action => "index").should == "/involvements"
    end

    it "maps #new" do
      route_for(:controller => "involvements", :action => "new").should == "/involvements/new"
    end

    it "maps #show" do
      route_for(:controller => "involvements", :action => "show", :id => "1").should == "/involvements/1"
    end

    it "maps #edit" do
      route_for(:controller => "involvements", :action => "edit", :id => "1").should == "/involvements/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "involvements", :action => "create").should == {:path => "/involvements", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "involvements", :action => "update", :id => "1").should == {:path =>"/involvements/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "involvements", :action => "destroy", :id => "1").should == {:path =>"/involvements/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/involvements").should == {:controller => "involvements", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/involvements/new").should == {:controller => "involvements", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/involvements").should == {:controller => "involvements", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/involvements/1").should == {:controller => "involvements", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/involvements/1/edit").should == {:controller => "involvements", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/involvements/1").should == {:controller => "involvements", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/involvements/1").should == {:controller => "involvements", :action => "destroy", :id => "1"}
    end
  end
end
