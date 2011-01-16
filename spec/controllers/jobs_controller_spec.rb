require 'spec_helper'

describe JobsController do
  render_views

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
  
  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :method => "",
                  :genome => "",
                  :public => "",
                  :name   => ""}
      end

      it "should not create a job" do
        lambda do
          post :create, :job => @attr
        end.should_not change(Job, :count)
      end

      it "should render the home page" do
        post :create, :job => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :method => "hmm",
                  :genome => "A. thaliana",
                  :public => "true",
                  :name   => "Just another HMMer"}
      end

      it "should create a job" do
        lambda do
          post :create, :job => @attr
        end.should change(Job, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :job => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :job => @attr
        flash[:success].should =~ /job submitted/i
      end
    end
  end
  
  describe "access control" do
    
    it "should deny access to 'create'" do 
      post :create
      response.should redirect_to(signin_path)
    end
    
    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @job = Factory(:job, :user => @user, :method => "hmmm")
      end

      it "should deny access" do
        delete :destroy, :id => @job
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @job = Factory(:job, :user => @user, :method => "svm")
      end

      it "should destroy the job" do
        lambda do 
          delete :destroy, :id => @job
        end.should change(Job, :count).by(-1)
      end
    end
  end
end
