# == Schema Information
# Schema version: 20110116005324
#
# Table name: results
#
#  id          :integer         not null, primary key
#  gi          :string(255)
#  score       :string(255)
#  length      :integer
#  job_id      :integer
#  analysis_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Result < ActiveRecord::Base
  attr_accessible :gi, :score, :job_id, :analysis_id
  
  belongs_to :job
  
  validates :gi,          :presence => true,
                          :length   => { :maximum => 20 }
  validates :score,       :presence => true,
                          :length   => { :maximum => 10 }
  validates :job_id,      :presence => true
  ## I'm not totally sure what the analysis_id stuff is...
  #validates :analysis_id, :presence => true
  
  default_scope :order => 'results.score DESC'
end
