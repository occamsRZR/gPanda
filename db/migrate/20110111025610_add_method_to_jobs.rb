class AddMethodToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :method, :string
  end

  def self.down
    remove_column :jobs, :method
  end
end
