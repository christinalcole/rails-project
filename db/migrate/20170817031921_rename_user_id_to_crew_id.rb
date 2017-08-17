class RenameUserIdToCrewId < ActiveRecord::Migration[5.0]
  def change
    rename_column :race_crews, :user_id, :crew_id
  end
end
