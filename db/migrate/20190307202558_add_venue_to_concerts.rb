class AddVenueToConcerts < ActiveRecord::Migration[5.2]
  def change
  	add_column :concerts, :venue, :string
  	add_column :concerts, :kountry, :string
  end
end
