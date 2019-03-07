class CreateConcertsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts_users do |t|
      t.references :concert, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
