# == Schema Information
# Schema version: 20110111215408
#
# Table name: jobs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  public     :binary
#  genome     :string(255)
#  method     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Job < ActiveRecord::Base
  
  attr_accessible :name, :public, :genome, :method
  
  belongs_to :user
  has_many :results, :dependent => :destroy
  
  default_scope :order => 'jobs.created_at DESC'
  
  validates :name, :presence => true,
                   :length   => { :maximum => 75 }
  validates :genome, :presence => true 
  validates :method, :presence => true 
  validates :public, :presence => true 
  validates :user_id, :presence => true 
end
