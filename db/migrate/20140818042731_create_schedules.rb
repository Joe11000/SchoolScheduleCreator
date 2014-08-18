class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :school
      t.timestamps
    end
  end
end
