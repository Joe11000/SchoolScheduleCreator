class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
	    t.integer :capacity
      t.integer :number
      t.belongs_to :school

      t.belongs_to :tcr_possibility
      t.timestamps
    end
  end
end
