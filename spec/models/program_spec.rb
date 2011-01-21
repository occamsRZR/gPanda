require 'spec_helper'

describe Program do

  # Let's load our factory data
  before(:each) do
    @program = Factory.attributes_for(:program)
  end
  
  # At the most basic level, we should be able to create a new program given valid attributes
  it "should create a new instance given valid attributes" do
    Program.create!(@program)
  end
  
  describe "name validations" do
    
    it "should require a name" do
      empty_name_program = Program.new(@program.merge(:name => ""))
      empty_name_program.should_not be_valid
    end
    
    it "should be a unique name" do
      Program.create!(@program)
      duplicate_name_program = Program.new(@program)
      duplicate_name_program.should_not be_valid
    end
      
  end
  
  describe "location validations" do
    
    it "should have a location" do
      empty_location_program = Program.new(@program.merge(:location => ""))
      empty_location_program.should_not be_valid
    end
    
    it "should have a unique location" do
      Program.create!(@program)
      duplicate_location_program = Program.new(@program)
      duplicate_location_program.should_not be_valid
    end
    
    describe "location format" do
      
      it "should reject locations in the wrong format" do
        locations = %w[./foo/bar foo ~/foobar]
        locations.each do |location|
          invalid_program_location = Program.new(@program.merge(:location => location))
          invalid_program_location.should_not be_valid
        end
      end
      
      it "should accpet locations in right format" do
        locations = %w[/foo/bar /foo /foobar/foo/bar/svm.pl]
        locations.each do |location|
          invalid_program_location = Program.new(@program.merge(:location => location))
          invalid_program_location.should be_valid
        end
      end
    end
  end
  
  describe "language validations" do
    
    
  end
end
