class ChangeCoursenumberToCoursecode < ActiveRecord::Migration
  def change
    remove_column :courses_pools, :course_number, :integer
    add_column    :courses_pools, :course_code, :string
  end
end
