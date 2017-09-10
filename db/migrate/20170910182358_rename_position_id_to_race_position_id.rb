class RenamePositionIdToRacePositionId < ActiveRecord::Migration[5.0]
  def change
    rename_column :race_crews, :position_id, :race_position_id
  end
end
