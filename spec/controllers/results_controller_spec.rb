require 'spec_helper'

describe ResultsController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @results = Factory(:results)
    end
    
    it "should be successful" do
      get :show, :id => @result
      response.should be_success
    end
    
    it "should find the right job" do
      get :show, :id => @result
      assigns(:result).should == @result
    end
  end
end
