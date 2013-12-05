class CreateTeacherCoursePossibilities < ActiveRecord::Migration
  def change
    create_table :teacher_course_possibilities do |t|
    	t.boolean    :scheduled_course, default: false
    	t.belongs_to :courses_pool
    	t.belongs_to :teacher
      t.timestamps
    end
  end
end
