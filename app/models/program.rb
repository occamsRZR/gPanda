# == Schema Information
# Schema version: 20110120212941
#
# Table name: programs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Program < ActiveRecord::Base
  attr_accessible :name, :location, :id

  belongs_to :job

  has_many :options
  
  # This leaning tower of toothpicks makes sure this is the ABSOLUTE path of the program
  location_regex = /^\/\w+/i
  
  validates :name,      :presence   => true,
                        :uniqueness => { :case_sensitive => false }
  validates :location,  :presence   => true,
                        :uniqueness => { :case_sensitive => false },
                        :format     => { :with => location_regex }
                        
end
