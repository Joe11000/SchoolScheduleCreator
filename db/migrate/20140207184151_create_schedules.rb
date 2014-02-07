class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
    	t.belongs_to :school
    	t.integer    :room_id
    	t.integer    :time_id
    	t.integer    :teacher_course_possibility_id
      t.timestamps
    end
  end
end
