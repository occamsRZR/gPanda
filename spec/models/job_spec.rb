require 'spec_helper'

describe Job do
  before(:each) do
    @attr = {
      :name => "gProteins Alpha SVM",
      :public => "true",
      :genome => "A. thaliana v1.0",
      :method => "SVM",
      :created_at => "TODAY, DUMMY",
      :user_id => 1
    }  
  end
  
  it "should create a new instance given valid attributes" do
    Job.create!(@attr)
  end
  
  it "should have a user_id associated with it" 
  
  describe "name validations" do
    
    it "should require a name" do
      no_name_job = Job.new(@attr.merge(:name => ""))
      no_name_job.should_not be_valid
    end
    
    it "should be less than 75 chars" do
      long_name = "a" * 76
      long_name_job = Job.new(@attr.merge(:name => long_name))
      long_name_job.should_not be_valid
    end
    
  end
  
  describe "public validations" do
    
    it "should not be an empty string" do
      empty_public_job = Job.new(@attr.merge(:public => ""))
      empty_public_job.should_not be_valid            
    end
    
    it "should return a boolean" do
      # Not sure how to implement this but would like
      # to be able to run a Job.public? method
    end
  end
  
  describe "genome validations" do 
    it "should require a genome" do
      no_genome_job = Job.new(@attr.merge(:genome => ""))
      no_genome_job.should_not be_valid
    end
  end
  
  describe "method validations" do
    it "should require a method" do
      no_method_job = Job.new(@attr.merge(:method => ""))
      no_method_job.should_not be_valid
    end
  end
  
  
  
  
end
