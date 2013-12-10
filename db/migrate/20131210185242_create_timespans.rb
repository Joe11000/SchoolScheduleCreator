class CreateTimespans < ActiveRecord::Migration
  def change
    create_table :timespans do |t|
    	t.datetime   :start_time
    	t.datetime   :end_time
    	t.references :timeable, polymorphic: true
      t.timestamps
    end
  end
end
