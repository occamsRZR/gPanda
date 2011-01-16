require 'spec_helper'

describe "Jobs" do

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do

    describe "failure" do

      it "should not submit a new job" do
        lambda do
          visit root_path
          fill_in :job_method, :with => ""
          fill_in :job_genome, :with => ""
          fill_in :job_public, :with => ""
          fill_in :job_name, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Job, :count)
      end
    end

    describe "success" do

      it "should submit a new job" do
        lambda do
          visit root_path
          fill_in :job_method, :with => "hmm"
          fill_in :job_genome, :with => "A. thaliana"
          fill_in :job_public, :with => "true"
          fill_in :job_name, :with => "G Proteins or something"
          click_button
        end.should change(Job, :count).by(1)
      end
    end
  end
end