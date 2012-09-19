class TestWorker
	include Sidekiq::Worker
	def perform(job_id, count)
		sleep count
		job = Job.find job_id
		job.update_attribute method: "blast"
		raise job.to_yaml
	end
end