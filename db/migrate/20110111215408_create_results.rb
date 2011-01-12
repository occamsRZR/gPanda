class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.string :gi
      t.string :score
      t.integer :job_id
      t.integer :analysis_id

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
