class JobsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  def index
    @jobs = Job.all
  end
  
  def create
    @job  = current_user.jobs.build(params[:job])
    if @job.save
      flash[:success] = "Job submitted!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def show
    @job = Job.find(params[:id])
    @title = @job.name
    @results = @job.results
  end

  def destroy
    @job.destroy
    redirect_back_or root_path
  end
  
  private
    def authorized_user
      @job = Job.find(params[:id])
      redirect_to root_path unless current_user?(@job.user)
    end
end