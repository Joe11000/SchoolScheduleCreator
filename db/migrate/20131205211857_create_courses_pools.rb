class CreateCoursesPools < ActiveRecord::Migration
  def change
    create_table :courses_pools do |t|
    	t.string     :subject                # ie  Cryptology
    	t.string     :course_number         # ie  MAT_512
    	t.integer    :min_students_to_teach # ie  10

    	t.belongs_to :school
      t.timestamps
    end
  end
end
