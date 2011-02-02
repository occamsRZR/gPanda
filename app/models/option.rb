class Option < ActiveRecord::Base
  attr_accessible :option
  belongs_to :program
end
