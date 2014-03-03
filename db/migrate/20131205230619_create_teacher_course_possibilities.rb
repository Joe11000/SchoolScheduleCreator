class CreateTeacherCoursePossibilities < ActiveRecord::Migration
  def change
    create_table :teacher_course_possibilities do |t|
      t.belongs_to :courses_pool
      t.belongs_to :teacher

      t.boolean    :scheduled_course, default: false

      t.timestamps
    end
  end
end
