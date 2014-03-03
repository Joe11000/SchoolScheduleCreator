class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
	    t.integer :capacity
      t.integer :number
      t.belongs_to :school

      t.belongs_to :teacher_course_possibility
      t.timestamps
    end
  end
end
