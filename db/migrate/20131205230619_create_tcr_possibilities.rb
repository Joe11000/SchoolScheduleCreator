class CreateTcrPossibilities < ActiveRecord::Migration
  def change
    create_table :tcr_possibilities do |t|
      t.belongs_to :courses_pool
      t.belongs_to :teacher
      t.belongs_to :room
      t.belongs_to :schedule
      t.boolean    :scheduled_course, default: false

      t.timestamps
    end
  end
end
