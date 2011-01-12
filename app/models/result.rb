# == Schema Information
# Schema version: 20110111215408
#
# Table name: results
#
#  id          :integer         not null, primary key
#  gi          :string(255)
#  score       :string(255)
#  job_id      :integer
#  analysis_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Result < ActiveRecord::Base
  attr_accessible :gi, :score, :job_id, :analysis_id
  
  validates :gi,          :presence => true,
                          :length   => { :maximum => 20 }
  validates :score,       :presence => true,
                          :length   => { :maximum => 10 }
  validates :job_id,      :presence => true
  validates :analysis_id, :presence => true
  
end
