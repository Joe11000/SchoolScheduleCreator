class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.string  :name
    	t.string  :location
    	t.text    :bio
    	t.string  :password_digest
      t.integer :passing_period_length, default: 4
      t.timestamps
    end
  end
end
