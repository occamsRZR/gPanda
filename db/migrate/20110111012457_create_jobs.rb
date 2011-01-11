class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.binary :public
      t.string :genome
      t.string :method

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
