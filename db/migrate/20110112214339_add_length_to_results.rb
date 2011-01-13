class AddLengthToResults < ActiveRecord::Migration
  def self.up
    add_column :results, :length, :integer
  end

  def self.down
    remove_column :results, :length
  end
end
