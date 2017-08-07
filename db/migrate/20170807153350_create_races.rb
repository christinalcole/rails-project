class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name, default: "1"
      t.datetime :date
      t.references :regatta, foreign_key: true

      t.timestamps
    end
  end
end
