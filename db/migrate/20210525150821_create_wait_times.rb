class CreateWaitTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :wait_times do |t|
      t.integer :seconds

      t.timestamps
    end
  end
end
