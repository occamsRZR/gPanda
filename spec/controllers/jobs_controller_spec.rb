require 'spec_helper'

describe JobsController do
  render_views
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    
    before(:each) do
      @job = Factory(:job, 'method' => 'svm')
    end
    
    it "should be successful" do
      get :show, :id => @job
      response.should be_success
    end
    
    it "should find the right job" do
      get :show, :id => @job
      assigns(:job).should == @job
    end
    
    
  end

end
