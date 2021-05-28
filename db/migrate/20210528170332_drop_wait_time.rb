class DropWaitTime < ActiveRecord::Migration[6.1]
  def change
    drop_table :wait_times
  end
end
