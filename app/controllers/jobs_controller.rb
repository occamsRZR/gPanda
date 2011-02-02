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
      # It would be best just to be able to pass a string into this 
      # system method in order to submit a job
      system("bfulk@ssh './quick_script'")
    else
      render 'pages/home'
    end
  end

  def show
    @job = Job.find(params[:id])
    @title = @job.name
    @results = @job.results.paginate(:page => params[:page])
  end

  def destroy
    @job.destroy
    redirect_back_or root_path
  end


  def update_program_select
    options = Option.where(:program_id => params[:id], :option => "descriptor").order(:value) unless params[:id].blank?
    render :partial => "programs", :locals => { :options => options }
  end
  
  private
    def authorized_user
      @job = Job.find(params[:id])
      redirect_to root_path unless current_user?(@job.user)
    end
end