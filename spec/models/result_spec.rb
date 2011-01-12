require 'spec_helper'

describe Result do
  
  # going to try to use a factory for this
  before(:each) do
    @result = Factory.attributes_for(:result)
  end
  
  # at the very basic level, we should be able to make a new result
  it "should create a new instance given valid attributes" do
    Result.create!(@result)
  end
  
  describe "gi validations" do
    
    it "should require a gi or another accession number" do
      empty_gi_result = Result.new(@result.merge(:gi => ""))
      empty_gi_result.should_not be_valid
    end
    
    it "should be less than 20 chars" do
      long_gi = "a" * 21
      long_gi_result = Result.new(@result.merge(:gi => long_gi))
      long_gi_result.should_not be_valid
    end
    
    it "should have the pattern of a accession number (hint: use regexes)"
  end
  
  
  
  describe "score validations" do
    
    it "should require a score" do      
      empty_score_result = Result.new(@result.merge(:score => ""))
      empty_score_result.should_not be_valid
    end
    
    it "should be less than 10 chars" do
      long_score = "a" * 100
      long_score_result = Result.new(@result.merge(:score => long_score))
      long_score_result.should_not be_valid
      
    end
    
  end
  
  describe "job_id validations" do
    
    it "should require a job_id" do
      empty_job_id = ""
      empty_job_id_result = Result.new(@result.merge(:job_id => empty_job_id))
      empty_job_id_result.should_not be_valid
    end
    
    it "should exist in the jobs table"
    
  end
  
  describe "analysis_id validations" do 
    # this may be implemented differently in later versions
    it "should require an analysis_id" do
      empty_analysis_id = ""
      empty_analysis_id_result = Result.new(@result.merge(:analysis_id => empty_analysis_id))
      empty_analysis_id_result.should_not be_valid
    end
  end
end
