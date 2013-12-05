class CreateCoursesPools < ActiveRecord::Migration
  def change
    create_table :courses_pools do |t|
    	t.string       :subject
    	t.datetime     :time_start
    	t.datetime     :time_end
    	t.integer      :min_students_to_teach

    	t.belongs_to   :school
      t.timestamps
    end
  end
end
