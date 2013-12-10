class CreateBreakTimes < ActiveRecord::Migration
  def change
    create_table :break_times do |t|
      t.boolean    :confirmed, default: false
      t.belongs_to :teacher
      t.references :timeable, polymorphic: true
      t.timestamps
    end
  end
end