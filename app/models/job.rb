# == Schema Information
# Schema version: 20110111045127
#
# Table name: jobs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  public     :binary
#  genome     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  method     :string(255)
#  user_id    :integer
#

class Job < ActiveRecord::Base
#  belongs_to :user
  attr_accessible :name, :public, :user_id, :genome, :method, :created_at
  
  has_many :results, :dependent => :destroy
  
  validates :name, :presence => true,
                   :length   => { :maximum => 75 }
  validates :genome, :presence => true 
  validates :method, :presence => true 
  validates :public, :presence => true 
  validates :user_id, :presence => true 
end
