class CreateBreakTimes < ActiveRecord::Migration
  def change
    create_table :break_times do |t|
	    t.datetime   :start_time
      t.datetime   :end_time
      t.boolean    :confirmed, default: false
      t.belongs_to :teacher
      t.timestamps
    end
  end
end