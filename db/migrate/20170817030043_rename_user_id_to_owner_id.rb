class RenameUserIdToOwnerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :boats, :user_id, :owner_id
  end
end
