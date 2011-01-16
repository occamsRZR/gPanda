class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.boolean :public
      t.string :genome
      t.string :method
      t.integer :user_id

      t.timestamps
    end
    add_index :jobs, :user_id
  end

  def self.down
    drop_table :jobs
  end
end
