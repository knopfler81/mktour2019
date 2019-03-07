class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
    	t.string :city
    	t.date :show_date
    	t.integer :user_id
      t.timestamps
    end
  end
end
