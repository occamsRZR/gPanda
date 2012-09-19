class BlastWorker
	include Sidekiq::Worker
	def perform(user_id, sequence, job_id, genome)
		system "touch #{Rails.root}/public/results/users/#{user_id}/hello"
		puts "/usr/bin/blastp -query #{Rails.root}/public/sequences/users/#{user_id}/test#{sequence}.seq -db #{Rails.root}/public/genomes/#{genome} -out #{Rails.root}/public/results/users/#{user_id}/blast_result.txt -show_gis"
		system "/usr/bin/blastp -query #{Rails.root}/public/sequences/users/#{user_id}/test#{sequence}.seq -db #{Rails.root}/public/genomes/#{genome} -out #{Rails.root}/public/results/users/#{user_id}/blast_result.txt -show_gis"

	end
end