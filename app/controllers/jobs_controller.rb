class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end
  
  def new
  end

  def show
    @job = Job.find(params[:id])
    @title = @job.name
    @results = @job.results
  end

end
