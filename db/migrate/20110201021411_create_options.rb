class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :option
      t.string :value
      t.string :program_id

      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
