# == Schema Information
# Schema version: 20110116005324
#
# Table name: jobs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  public     :boolean
#  genome     :string(255)
#  method     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Job < ActiveRecord::Base
  
  attr_accessible :name, :public, :genome, :method, :user_id
  
  belongs_to :user
  has_many :results, :dependent => :destroy
  ### program is the same as method name
  has_one  :program
  
  default_scope :order => 'jobs.created_at DESC'
  
  validates :name, :presence => true,
                   :length   => { :maximum => 75 }
  validates :genome, :presence => true 
  validates :method, :presence => true 
  validates :public, :presence => true 
  validates :user_id, :presence => true 
end
