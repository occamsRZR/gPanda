class JobsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  def index
    @jobs = Job.all
  end
  
  def create
    # => This will just be me for right now while I"m testing
    current_user = User.first
    @job = Job.new     name: "Example42",
                    user_id: 1,
                     genome: "A. thaliana",
                     method: "BLAST",
                     public: true

    if @job.save
      flash[:success] = "Job submitted!"
      genome = "TAIR10_pep_20101214"
      sequence = 1
      BlastWorker.perform_async(current_user.id, sequence, @job.id, genome)
      TestWorker.perform_in(1.minute, @job.id, 300)
      redirect_to root_path
    else
      flash[:error] = "Your job wasn't submitted."
      render 'pages/home'
    end
  end

  def new
    @job = Job.new
    @programs = Program.all
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