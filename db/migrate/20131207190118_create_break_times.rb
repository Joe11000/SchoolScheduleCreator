class CreateBreakTimes < ActiveRecord::Migration
  def change
    create_table :break_times do |t|

      t.timestamps
    end
  end
end
