class JobObserver < ActiveRecord::Observer
  observe :job

  def after_create(job)
    # this needs to submit a job using sge from Bio::SGE
  end

  def after_update(job)
    # this needs to email the user once the job is finished
  end

  private
  
    def qsub_submit
      # all jobs will be submitted through qsub
    end

end
