class BlastWorker
	include Sidekiq::Worker

	def perform(user_id, sequence, job_id, genome)
		db_location = "#{Rails.root}/public/genomes/#{genome}"
		query_location = "#{Rails.root}/public/sequences/users/#{user_id}/test#{sequence}.seq"
		# => BioRuby
		blast = Bio::Blast.local("blastp", db_location)
		query_seqs = Bio::FlatFile.open(Bio::FastaFormat, query_location)

		query_seqs.each do |sequence|
			report = blast.query sequence
			report.each do |hit|
				Result.create gi: hit.accession,
							score: hit.bit_score,
							job_id: job_id

			end
		end

		puts "HELL YEAAAAH"

		# This will be refactored using BioRuby
		#system "/usr/bin/blastp -q #{Rails.root}/public/sequences/users/#{user_id}/test#{sequence}.seq -db #{Rails.root}/public/genomes/#{genome} -out #{Rails.root}/public/results/users/#{user_id}/blast_result#{job_id}.txt -show_gis"

	end

	def parse_results()

	end

end