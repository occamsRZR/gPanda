require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a User page at '/user'" do
    get '/user'
    response.should have_selector('title', :content => "User")
  end
  
  it "should have a Job page at '/job'" do
    get '/job'
    response.should have_selector('title', :content => "Job")
  end

  it "should have a Demo page at '/demo'" do
    get '/demo'
    response.should have_selector('title', :content => "Demo")
  end

  it "should have a News page at '/news'" do
    get '/news'
    response.should have_selector('title', :content => "News")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
end