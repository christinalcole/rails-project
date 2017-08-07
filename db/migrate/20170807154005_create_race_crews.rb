class CreateRaceCrews < ActiveRecord::Migration[5.0]
  def change
    create_table :race_crews do |t|
      t.references :user, foreign_key: true
      t.references :position, foreign_key: true
      t.references :boat, foreign_key: true
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
