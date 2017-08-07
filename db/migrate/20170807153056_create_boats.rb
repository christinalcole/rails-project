class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :make
      t.integer :length
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
