class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
    	t.string     :name
    	t.text       :bio
    	t.string     :break_time
    	t.belongs_to :school
      t.timestamps
    end
  end
end
