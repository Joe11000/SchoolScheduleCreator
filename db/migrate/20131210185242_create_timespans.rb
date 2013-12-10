class CreateTimespans < ActiveRecord::Migration
  def change
    create_table :timespans do |t|

      t.timestamps
    end
  end
end
